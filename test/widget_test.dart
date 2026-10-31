import 'dart:ui';

import 'package:akademik_sprint/main.dart';
import 'package:akademik_sprint/models.dart';
import 'package:akademik_sprint/question_engine.dart';
import 'package:akademik_sprint/screens/feed_screen.dart';
import 'package:akademik_sprint/stats_store.dart';
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _settle(WidgetTester tester) async {
  for (var i = 0; i < 40; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await tester.pumpAndSettle();
}

void _phone(WidgetTester tester) {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

void main() {
  test('veri dosyalari dogru ayristiriliyor', () {
    expect(allWords.length, greaterThanOrEqualTo(3000));
    expect(allWords.where((w) => w.pos == 'p').length, greaterThan(50), reason: 'phrasal verb');
    expect(allWords.where((w) => w.pos == 'c').length, greaterThan(50), reason: 'baglac');
    expect(allSentences.length, greaterThanOrEqualTo(140));
    for (final level in [1, 2, 3]) {
      expect(allSentences.where((s) => s.level == level).length, greaterThan(30));
    }
    expect(allSentences.length, greaterThanOrEqualTo(40));
    expect(allWords.map((w) => w.en.toLowerCase()).toSet().length, allWords.length,
        reason: 'tekrar eden kelime var');
    for (final level in [1, 2, 3]) {
      expect(allWords.where((w) => w.level == level).length, greaterThan(300));
    }
    for (final s in allSentences) {
      expect(s.tr, isNot(equals(s.wrong)));
    }
  });

  test('her soruda iki farkli sik ve dogru cevap var', () {
    for (final mode in ContentMode.values) {
      for (final d in Difficulty.values) {
        final engine = QuestionEngine(content: mode, difficulty: d);
        for (var i = 0; i < 300; i++) {
          final q = engine.next();
          expect(q.options.length, 2);
          expect(q.options[0], isNot(equals(q.options[1])));
          expect(q.correctIndex, inInclusiveRange(0, 1));
        }
      }
    }
  });

  test('secilen seviyedeki kelimeler soruluyor', () {
    for (final d in [Difficulty.easy, Difficulty.medium, Difficulty.hard]) {
      final engine = QuestionEngine(content: ContentMode.words, difficulty: d);
      for (var i = 0; i < 200; i++) {
        final q = engine.next();
        final w = allWords.firstWhere((w) => w.id == q.itemId);
        expect(w.level, d.level);
      }
    }
  });

  test('karisik modda ilk sorular kolay kelimelerden geliyor', () {
    final engine = QuestionEngine(content: ContentMode.words);
    for (var i = 0; i < QuestionEngine.warmUpCount; i++) {
      final q = engine.next();
      expect(allWords.firstWhere((w) => w.id == q.itemId).level, 1);
    }
  });

  test('yanlis yapilan kelime birkac kart sonra geri geliyor', () {
    final engine = QuestionEngine(content: ContentMode.words);
    final first = engine.next();
    engine.markWrong(first.itemId);
    final ids = [for (var i = 0; i < QuestionEngine.retryGap + 1; i++) engine.next().itemId];
    expect(ids, contains(first.itemId));
  });

  test('celdirici dogru cevapla anlamca cakismiyor', () {
    final engine = QuestionEngine(content: ContentMode.words);
    for (var i = 0; i < 2000; i++) {
      final q = engine.next();
      final a = q.options[0].split(',').map((e) => e.trim());
      final b = q.options[1].split(',').map((e) => e.trim()).toList();
      for (final x in a) {
        for (final y in b) {
          expect(x.contains(y) || y.contains(x), isFalse, reason: '${q.prompt}: ${q.options}');
        }
      }
    }
  });

  test('hatalarim modu yalnizca yanlis yapilan ogeleri sorar', () {
    final ids = [allWords[3].id, allWords[400].id, allSentences[5].id];
    final engine = QuestionEngine.review(ids);
    expect(engine.reviewCount, 3);
    for (var i = 0; i < 30; i++) {
      expect(ids, contains(engine.next().itemId));
    }
  });

  test('gun serisi ve hata listesi kaydediliyor', () async {
    SharedPreferences.setMockInitialValues({});
    final store = await StatsStore.load();
    final d1 = DateTime(2026, 3, 10, 9);
    await store.record(itemId: 'w:a', isCorrect: false, streak: 0, now: d1);
    expect(store.dayStreakAt(d1), 1);
    expect(store.mistakes, ['w:a']);

    await store.record(itemId: 'w:b', isCorrect: true, streak: 1, now: d1.add(const Duration(hours: 3)));
    expect(store.dayStreakAt(d1), 1, reason: 'ayni gun seriyi artirmaz');

    final d2 = d1.add(const Duration(days: 1));
    await store.record(itemId: 'w:a', isCorrect: true, streak: 2, now: d2);
    expect(store.dayStreakAt(d2), 2);
    expect(store.mistakes, isEmpty, reason: 'dogru cevaplaninca hatalardan cikar');

    expect(store.dayStreakAt(d2.add(const Duration(days: 2))), 0, reason: 'bir gun atlaninca seri biter');
    await store.record(itemId: 'w:c', isCorrect: true, streak: 3, now: d2.add(const Duration(days: 2)));
    expect(store.dayStreakAt(d2.add(const Duration(days: 2))), 1);
  });

  testWidgets('ana ekran aciliyor ve akis basliyor', (tester) async {
    _phone(tester);
    SharedPreferences.setMockInitialValues({'onboardingDone': true, 'soundOn': false});
    final store = await StatsStore.load();
    await tester.pumpWidget(DilSprintApp(store: store));
    await _settle(tester);
    expect(find.text('DilSprint', findRichText: true), findsOneWidget);
    expect(find.text('Kaydır'), findsOneWidget);
    expect(find.text('Dokun'), findsOneWidget);
    expect(find.textContaining('YDS'), findsNothing);
    expect(find.textContaining('ALES'), findsNothing);

    await tester.tap(find.text('Dokun'));
    await tester.tap(find.text('20 kartlık sprint'));
    await tester.pumpAndSettle();
    expect(find.text('1/20'), findsOneWidget);
  });

  testWidgets('sprint bitince ozet ekrani gelir', (tester) async {
    _phone(tester);
    SharedPreferences.setMockInitialValues({'soundOn': false, 'hapticsOn': false});
    final store = await StatsStore.load();
    await tester.pumpWidget(MaterialApp(
      home: FeedScreen(
        store: store,
        answerMode: AnswerMode.tap,
        contentMode: ContentMode.words,
        difficulty: Difficulty.easy,
        sprintLength: 20,
      ),
    ));
    for (var i = 0; i < 20; i++) {
      // Her karta cevap vermeden kaydir (atla).
      await tester.drag(find.byType(FeedScreen), const Offset(0, -700));
      await tester.pumpAndSettle();
    }
    expect(find.text('Sprint tamam!'), findsOneWidget);
    expect(find.text('Bir sprint daha'), findsOneWidget);
    expect(store.sprintsDone, 1);
  });

  testWidgets('ilk acilista onboarding gosterilir ve secimler kaydedilir', (tester) async {
    _phone(tester);
    SharedPreferences.setMockInitialValues({'soundOn': false});
    final store = await StatsStore.load();
    await tester.pumpWidget(DilSprintApp(store: store));
    await _settle(tester);

    expect(find.text('Kaydır, bil, geç.'), findsOneWidget);
    await tester.tap(find.text('Hadi başlayalım'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Orta'));
    await tester.pump();
    await tester.tap(find.text('Devam'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dokun'));
    await tester.pump();
    await tester.tap(find.text('hızlı'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Devam'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('50 kart'));
    await tester.pump();
    await tester.tap(find.text('Bitir ve başla'));
    await tester.pumpAndSettle();

    expect(find.text('DilSprint', findRichText: true), findsOneWidget);
    expect(store.onboardingDone, isTrue);
    expect(store.difficulty, Difficulty.medium);
    expect(store.answerMode, AnswerMode.tap);
    expect(store.sprintLength, 50);
  });
}

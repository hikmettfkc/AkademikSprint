import 'package:akademik_sprint/main.dart';
import 'package:akademik_sprint/models.dart';
import 'package:akademik_sprint/question_engine.dart';
import 'package:akademik_sprint/stats_store.dart';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _skipIntro(WidgetTester tester) async {
  for (var i = 0; i < 40; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await tester.pumpAndSettle();
}

void main() {
  test('veri dosyalari dogru ayristiriliyor', () {
    expect(allWords.length, greaterThan(150));
    expect(allSentences.length, greaterThanOrEqualTo(40));
    expect(allWords.map((w) => w.en).toSet().length, allWords.length, reason: 'tekrar eden kelime var');
    for (final s in allSentences) {
      expect(s.tr, isNot(equals(s.wrong)));
    }
  });

  test('her soruda iki farkli sik ve dogru cevap var', () {
    for (final mode in ContentMode.values) {
      final engine = QuestionEngine(content: mode);
      for (var i = 0; i < 500; i++) {
        final q = engine.next();
        expect(q.options.length, 2);
        expect(q.options[0], isNot(equals(q.options[1])));
        expect(q.correctIndex, inInclusiveRange(0, 1));
      }
    }
  });

  test('ilk sorular kolay kelimelerden geliyor', () {
    final engine = QuestionEngine(content: ContentMode.words);
    for (var i = 0; i < QuestionEngine.warmUpCount; i++) {
      final q = engine.next();
      final w = allWords.firstWhere((w) => w.id == q.itemId);
      expect(w.level, 1);
    }
  });

  test('yanlis yapilan kelime birkac kart sonra geri geliyor', () {
    final engine = QuestionEngine(content: ContentMode.words);
    final first = engine.next();
    engine.markWrong(first.itemId);
    final ids = [for (var i = 0; i < QuestionEngine.retryGap + 1; i++) engine.next().itemId];
    expect(ids, contains(first.itemId));
  });

  testWidgets('ana ekran aciliyor ve akis basliyor', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({'onboardingDone': true});
    final store = await StatsStore.load();
    await tester.pumpWidget(DilSprintApp(store: store));
    await _skipIntro(tester);
    expect(find.text('DilSprint', findRichText: true), findsOneWidget);
    expect(find.text('Kaydır'), findsOneWidget);
    expect(find.text('Dokun'), findsOneWidget);

    await tester.tap(find.text('Dokun'));
    await tester.ensureVisible(find.text('Başla'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Başla'));
    await tester.pumpAndSettle();
    expect(find.text('Bu kelimenin anlamı ne?').evaluate().isNotEmpty ||
        find.text('İngilizcesi hangisi?').evaluate().isNotEmpty, isTrue);

  });

  testWidgets('ilk acilista onboarding gosterilir ve secimler kaydedilir', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final store = await StatsStore.load();
    await tester.pumpWidget(DilSprintApp(store: store));
    await _skipIntro(tester);

    expect(find.text('Kaydır, bil, geç.'), findsOneWidget);
    await tester.tap(find.text('Hadi başlayalım'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('ALES'));
    await tester.pump();
    await tester.tap(find.text('Devam'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dokun'));
    await tester.pump();
    await tester.tap(find.text('hızlı'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Devam'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('5 sprint'));
    await tester.pump();
    await tester.tap(find.text('Bitir ve başla'));
    await tester.pumpAndSettle();

    expect(find.text('DilSprint', findRichText: true), findsOneWidget);
    expect(store.onboardingDone, isTrue);
    expect(store.examGoal, ExamGoal.ales);
    expect(store.answerMode, AnswerMode.tap);
    expect(store.dailySprintGoal, 5);
  });
}

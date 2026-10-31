import 'dart:math';

import 'models.dart';

/// Sonsuz soru akisi uretir.
///
/// - Ilk sorular kolay seviyeden gelir: "yapabilirsin" hissi icin.
/// - Yanlis yapilan ogeler birkac kart sonra tekrar karsiya cikar.
/// - Her zaman iki sik vardir; celdirici bariz sekilde farkli bir anlamdir.
class QuestionEngine {
  QuestionEngine({required this.content, Random? random})
      : _rng = random ?? Random() {
    _refill();
  }

  final ContentMode content;
  final Random _rng;

  static const warmUpCount = 12;
  static const retryGap = 5;

  final List<Object> _queue = [];
  final List<_Retry> _retries = [];
  int _produced = 0;
  int _colorCursor = 0;

  Question next() {
    final due = _retries.indexWhere((r) => r.dueAt <= _produced);
    final Object item;
    if (due != -1) {
      item = _retries.removeAt(due).item;
    } else {
      if (_queue.isEmpty) _refill();
      item = _queue.removeAt(0);
    }
    _produced++;
    return _build(item);
  }

  /// Yanlis cevaplanan ogeyi kisa bir sure sonra tekrar sor.
  void markWrong(String itemId) {
    final item = _findItem(itemId);
    if (item == null) return;
    if (_retries.any((r) => _idOf(r.item) == itemId)) return;
    _retries.add(_Retry(item, _produced + retryGap));
  }

  void _refill() {
    final words = List<Word>.of(allWords)..shuffle(_rng);
    final sentences = List<Sentence>.of(allSentences)..shuffle(_rng);
    final List<Object> batch;
    switch (content) {
      case ContentMode.words:
        batch = [...words];
      case ContentMode.sentences:
        batch = [...sentences];
      case ContentMode.mixed:
        // Her 3 kelimeden sonra 1 cumle.
        batch = [];
        var s = 0;
        for (var i = 0; i < words.length; i++) {
          batch.add(words[i]);
          if (i % 3 == 2 && s < sentences.length) batch.add(sentences[s++]);
        }
    }

    // Ilk turda kolay kelimeleri one al.
    if (_produced == 0) {
      final easy = batch.where((e) => e is Word && e.level == 1).take(warmUpCount).toList();
      batch.removeWhere(easy.contains);
      if (content == ContentMode.sentences) {
        // Cumlelerde kisa olanlar daha kolay.
        batch.sort((a, b) => (a as Sentence).en.length.compareTo((b as Sentence).en.length));
        final head = batch.take(6).toList()..shuffle(_rng);
        batch.replaceRange(0, head.length, head);
      }
      batch.insertAll(0, easy);
    }
    _queue.addAll(batch);
  }

  Question _build(Object item) {
    final color = _colorCursor++ % 6;
    final correctFirst = _rng.nextBool();

    List<String> two(String right, String wrong) => correctFirst ? [right, wrong] : [wrong, right];

    if (item is Sentence) {
      return Question(
        itemId: item.id,
        kind: QuestionKind.sentence,
        prompt: item.en,
        options: two(item.tr, item.wrong),
        correctIndex: correctFirst ? 0 : 1,
        colorIndex: color,
      );
    }

    final word = item as Word;
    final distractor = _distractorFor(word);
    final reverse = _rng.nextDouble() < 0.25;
    return Question(
      itemId: word.id,
      kind: reverse ? QuestionKind.wordTrEn : QuestionKind.wordEnTr,
      prompt: reverse ? word.tr : word.en,
      options: reverse ? two(word.en, distractor.en) : two(word.tr, distractor.tr),
      correctIndex: correctFirst ? 0 : 1,
      colorIndex: color,
    );
  }

  Word _distractorFor(Word word) {
    bool ok(Word w) => w.en != word.en && w.meanings.intersection(word.meanings).isEmpty;
    final samePos = allWords.where((w) => w.pos == word.pos && ok(w)).toList();
    final pool = samePos.isNotEmpty ? samePos : allWords.where(ok).toList();
    return pool[_rng.nextInt(pool.length)];
  }

  Object? _findItem(String id) {
    if (id.startsWith('w:')) {
      for (final w in allWords) {
        if (w.id == id) return w;
      }
    } else {
      for (final s in allSentences) {
        if (s.id == id) return s;
      }
    }
    return null;
  }

  static String _idOf(Object item) => item is Word ? item.id : (item as Sentence).id;
}

class _Retry {
  final Object item;
  final int dueAt;
  _Retry(this.item, this.dueAt);
}

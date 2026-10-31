import 'data/sentence_data.dart';
import 'data/word_data.dart';

enum AnswerMode { swipe, tap }

enum ContentMode { words, sentences, mixed }

/// Kelime seviyesi secimi. [mixed] tum seviyeleri karistirir.
enum Difficulty {
  easy('Kolay', 1),
  medium('Orta', 2),
  hard('Zor', 3),
  mixed('Karışık', 0);

  const Difficulty(this.label, this.level);
  final String label;
  final int level;

  bool includes(int itemLevel) => level == 0 || level == itemLevel;
}

/// Secilebilir sprint uzunluklari. 0 = sonsuz.
const sprintOptions = [20, 50, 100, 0];

/// Hatalarim modunda bir turdaki en fazla kart.
const reviewSprintLength = 20;

String sprintLabel(int n) => n == 0 ? 'Sonsuz' : '$n';

class Word {
  final String en;
  final String tr;
  final String pos;
  final int level;
  const Word(this.en, this.tr, this.pos, this.level);

  String get id => 'w:$en';

  /// "bol, bereketli" -> {"bol", "bereketli"}
  Set<String> get meanings => tr.split(',').map((e) => e.trim()).toSet();
}

class Sentence {
  final int index;
  final String en;
  final String tr;
  final String wrong;
  const Sentence(this.index, this.en, this.tr, this.wrong, [this._level]);

  final int? _level;

  String get id => 's:$index';

  /// Elle verilmemisse uzunluga gore: kisa cumleler daha kolay.
  int get level => _level ?? (en.length < 53 ? 1 : (en.length < 61 ? 2 : 3));
}

enum QuestionKind { wordEnTr, wordTrEn, sentence }

class Question {
  final String itemId;
  final QuestionKind kind;
  final String prompt;
  final List<String> options; // her zaman 2 sik
  final int correctIndex;
  final int colorIndex;

  /// Kelime turu (v, n, a, d, p, c); cumlelerde bos.
  final String pos;

  const Question({
    this.pos = '',
    required this.itemId,
    required this.kind,
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.colorIndex,
  });

  String get correctText => options[correctIndex];

  /// Kartta Ingilizce metin mi var? (telaffuz butonu icin)
  bool get promptIsEnglish => kind != QuestionKind.wordTrEn;

  String get label => switch (kind) {
        QuestionKind.wordEnTr => (pos == 'p' || pos == 'c') ? 'Bu ifadenin anlamı ne?' : 'Bu kelimenin anlamı ne?',
        QuestionKind.wordTrEn => 'İngilizcesi hangisi?',
        QuestionKind.sentence => 'Doğru çeviri hangisi?',
      };
}

final List<Word> allWords = rawWords
    .trim()
    .split('\n')
    .map((line) {
      final p = line.split('|');
      return Word(p[0].trim(), p[1].trim(), p[2].trim(), int.parse(p[3].trim()));
    })
    .toList(growable: false);

final List<Sentence> allSentences = () {
  final lines = rawSentences.trim().split('\n');
  return [
    for (var i = 0; i < lines.length; i++)
      () {
        final p = lines[i].split('||');
        return Sentence(i, p[0].trim(), p[1].trim(), p[2].trim(), p.length > 3 ? int.parse(p[3].trim()) : null);
      }(),
  ];
}();

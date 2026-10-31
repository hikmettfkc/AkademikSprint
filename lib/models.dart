import 'data/sentence_data.dart';
import 'data/word_data.dart';

enum AnswerMode { swipe, tap }

enum ContentMode { words, sentences, mixed }

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
  const Sentence(this.index, this.en, this.tr, this.wrong);

  String get id => 's:$index';
}

enum QuestionKind { wordEnTr, wordTrEn, sentence }

class Question {
  final String itemId;
  final QuestionKind kind;
  final String prompt;
  final List<String> options; // her zaman 2 sik
  final int correctIndex;
  final int colorIndex;

  const Question({
    required this.itemId,
    required this.kind,
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.colorIndex,
  });

  String get correctText => options[correctIndex];

  String get label => switch (kind) {
        QuestionKind.wordEnTr => 'Bu kelimenin anlamı ne?',
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
        return Sentence(i, p[0].trim(), p[1].trim(), p[2].trim());
      }(),
  ];
}();

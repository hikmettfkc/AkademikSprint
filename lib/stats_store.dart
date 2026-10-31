import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

/// Cihazda tutulan basit istatistikler (uyelik yok).
class StatsStore {
  StatsStore._(this._prefs);

  static Future<StatsStore> load() async => StatsStore._(await SharedPreferences.getInstance());

  final SharedPreferences _prefs;

  int get answered => _prefs.getInt('answered') ?? 0;
  int get correct => _prefs.getInt('correct') ?? 0;
  int get bestStreak => _prefs.getInt('bestStreak') ?? 0;
  int get learnedCount => (_prefs.getStringList('learned') ?? const []).length;

  AnswerMode get answerMode =>
      AnswerMode.values[(_prefs.getInt('answerMode') ?? 0).clamp(0, AnswerMode.values.length - 1)];
  ContentMode get contentMode =>
      ContentMode.values[(_prefs.getInt('contentMode') ?? 0).clamp(0, ContentMode.values.length - 1)];

  set answerMode(AnswerMode m) => _prefs.setInt('answerMode', m.index);
  set contentMode(ContentMode m) => _prefs.setInt('contentMode', m.index);

  bool get seenSwipeHint => _prefs.getBool('seenSwipeHint') ?? false;
  void markSwipeHintSeen() => _prefs.setBool('seenSwipeHint', true);

  Future<void> record({required String itemId, required bool isCorrect, required int streak}) async {
    await _prefs.setInt('answered', answered + 1);
    if (isCorrect) {
      await _prefs.setInt('correct', correct + 1);
      final learned = _prefs.getStringList('learned') ?? <String>[];
      if (!learned.contains(itemId)) {
        learned.add(itemId);
        await _prefs.setStringList('learned', learned);
      }
    }
    if (streak > bestStreak) await _prefs.setInt('bestStreak', streak);
  }
}

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

  bool get onboardingDone => _prefs.getBool('onboardingDone') ?? false;
  set onboardingDone(bool v) => _prefs.setBool('onboardingDone', v);

  Difficulty get difficulty =>
      Difficulty.values[(_prefs.getInt('difficulty') ?? 0).clamp(0, Difficulty.values.length - 1)];
  set difficulty(Difficulty d) => _prefs.setInt('difficulty', d.index);

  /// Sprint uzunlugu (kart). 0 = sonsuz.
  int get sprintLength {
    final v = _prefs.getInt('sprintLength') ?? 20;
    return sprintOptions.contains(v) ? v : 20;
  }

  set sprintLength(int v) => _prefs.setInt('sprintLength', v);

  bool get soundOn => _prefs.getBool('soundOn') ?? true;
  set soundOn(bool v) => _prefs.setBool('soundOn', v);

  bool get hapticsOn => _prefs.getBool('hapticsOn') ?? true;
  set hapticsOn(bool v) => _prefs.setBool('hapticsOn', v);

  /// Yeni karta gecince Ingilizce metni otomatik seslendir.
  bool get autoSpeak => _prefs.getBool('autoSpeak') ?? false;
  set autoSpeak(bool v) => _prefs.setBool('autoSpeak', v);

  // ---- Hatalarim ----

  /// Yanlis yapilan ve henuz dogru cevaplanmamis ogeler.
  List<String> get mistakes => _prefs.getStringList('mistakes') ?? const [];

  // ---- Gunluk seri ----

  static String _day(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Bugun ya da dun calisildiysa suren gun serisi; yoksa 0.
  int dayStreakAt(DateTime now) {
    final last = _prefs.getString('lastActiveDay');
    if (last == null) return 0;
    final today = _day(now);
    final yesterday = _day(now.subtract(const Duration(days: 1)));
    if (last == today || last == yesterday) return _prefs.getInt('dayStreak') ?? 0;
    return 0;
  }

  int get dayStreak => dayStreakAt(DateTime.now());

  bool activeTodayAt(DateTime now) => _prefs.getString('lastActiveDay') == _day(now);

  Future<void> _touchDay(DateTime now) async {
    final today = _day(now);
    final last = _prefs.getString('lastActiveDay');
    if (last == today) return;
    final yesterday = _day(now.subtract(const Duration(days: 1)));
    final next = last == yesterday ? (_prefs.getInt('dayStreak') ?? 0) + 1 : 1;
    await _prefs.setInt('dayStreak', next);
    await _prefs.setString('lastActiveDay', today);
  }

  int get sprintsDone => _prefs.getInt('sprintsDone') ?? 0;
  Future<void> markSprintDone() => _prefs.setInt('sprintsDone', sprintsDone + 1);

  /// Tum ilerlemeyi siler (ayarlar korunur).
  Future<void> resetProgress() async {
    for (final k in [
      'answered', 'correct', 'bestStreak', 'learned', 'sprintsDone', //
      'mistakes', 'dayStreak', 'lastActiveDay',
    ]) {
      await _prefs.remove(k);
    }
  }

  bool get seenSwipeHint => _prefs.getBool('seenSwipeHint') ?? false;
  void markSwipeHintSeen() => _prefs.setBool('seenSwipeHint', true);

  Future<void> record({
    required String itemId,
    required bool isCorrect,
    required int streak,
    DateTime? now,
  }) async {
    await _touchDay(now ?? DateTime.now());
    await _prefs.setInt('answered', answered + 1);
    final m = List<String>.of(mistakes);
    final changed = isCorrect ? m.remove(itemId) : !m.contains(itemId);
    if (!isCorrect && changed) m.add(itemId);
    if (changed) await _prefs.setStringList('mistakes', m);
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

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'stats_store.dart';

/// Dogru / yanlis / sprint sonu sesleri ve titresim.
///
/// Sesler ayarlardan kapatilabilir. iPhone'da sessiz moda saygi duyar ve
/// arka planda calan muzigi durdurmaz (ustune karisir).
class FeedbackFx {
  FeedbackFx(this.store);

  static FeedbackFx? _instance;

  /// Uygulama boyunca tek bir ornek; ilk cagrida sesleri yukler.
  static FeedbackFx of(StatsStore store) => _instance ??= (FeedbackFx(store)..init());

  final StatsStore store;
  AudioPool? _correct;
  AudioPool? _wrong;
  AudioPool? _done;
  bool _initStarted = false;

  Future<void> init() async {
    if (_initStarted) return;
    _initStarted = true;
    try {
      final ctx = AudioContextConfig(
        respectSilence: true,
        focus: AudioContextConfigFocus.mixWithOthers,
      ).build();
      Future<AudioPool> pool(String name) => AudioPool.create(
            source: AssetSource('sounds/$name.wav'),
            maxPlayers: 3,
            audioContext: ctx,
            playerMode: PlayerMode.lowLatency,
          );
      _correct = await pool('correct');
      _wrong = await pool('wrong');
      _done = await pool('sprint_done');
    } catch (e) {
      // Ses calinamiyorsa (ornegin testlerde) sessizce devam et.
      debugPrint('Ses baslatilamadi: $e');
    }
  }

  void correct() {
    _play(_correct, 0.8);
    if (store.hapticsOn) HapticFeedback.lightImpact();
  }

  void wrong() {
    _play(_wrong, 0.6);
    if (store.hapticsOn) HapticFeedback.selectionClick();
  }

  void sprintDone() {
    _play(_done, 0.8);
    if (store.hapticsOn) HapticFeedback.mediumImpact();
  }

  void _play(AudioPool? pool, double volume) {
    if (!store.soundOn || pool == null) return;
    pool.start(volume: volume).catchError((Object _) => () async {});
  }
}

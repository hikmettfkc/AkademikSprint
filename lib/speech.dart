import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Telefonun kendi seslendirme motoruyla Ingilizce telaffuz.
/// Internet gerektirmez, ek ses dosyasi yoktur.
class Speech {
  Speech._();
  static final Speech instance = Speech._();

  FlutterTts? _tts;
  bool _ready = false;

  Future<void> _init() async {
    if (_ready) return;
    try {
      final tts = FlutterTts();
      await tts.setLanguage('en-US');
      await tts.setSpeechRate(0.45);
      await tts.setPitch(1.0);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        // Kullanici dokununca calsin: sessiz modda da duyulsun, muzigi durdurmasin.
        await tts.setSharedInstance(true);
        await tts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ]);
      }
      _tts = tts;
      _ready = true;
    } catch (e) {
      debugPrint('Seslendirme baslatilamadi: $e');
    }
  }

  Future<void> say(String text) async {
    await _init();
    try {
      await _tts?.stop();
      await _tts?.speak(text);
    } catch (e) {
      debugPrint('Seslendirme hatasi: $e');
    }
  }
}

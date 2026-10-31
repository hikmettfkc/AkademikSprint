import 'package:flutter/material.dart';

import '../models.dart';
import '../theme.dart';
import '../widgets/blob_background.dart';
import '../widgets/chunky_button.dart';
import '../widgets/logo_mark.dart';
import '../widgets/speak_button.dart';

class SprintResult {
  const SprintResult({
    required this.total,
    required this.answered,
    required this.correct,
    required this.bestStreak,
    required this.elapsed,
    required this.missed,
  });

  final int total;
  final int answered;
  final int correct;
  final int bestStreak;
  final Duration elapsed;
  final List<Question> missed;

  int get percent => answered == 0 ? 0 : (correct * 100 / answered).round();
}

/// Sprint bitince gosterilen kutlama ve ozet ekrani.
class SprintSummary extends StatelessWidget {
  const SprintSummary({
    super.key,
    required this.result,
    required this.onAgain,
    required this.onHome,
    this.title = 'Sprint tamam!',
    this.againLabel = 'Bir sprint daha',
  });

  final String title;
  final String againLabel;

  final SprintResult result;
  final VoidCallback onAgain;
  final VoidCallback onHome;

  String get _message {
    final p = result.percent;
    if (p >= 90) return 'Muhteşem bir sprint!';
    if (p >= 70) return 'Çok iyi gidiyorsun!';
    if (p >= 40) return 'Güzel ilerleme!';
    return 'Her sprint seni ileri taşıyor.';
  }

  String get _time {
    final m = result.elapsed.inMinutes;
    final s = result.elapsed.inSeconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: BlobBackground(
        color: AppColors.butter,
        seed: 11,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                      children: [
                        const Center(child: AnimatedLogoMark(size: 130)),
                        const SizedBox(height: 10),
                        Text(title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 34, fontWeight: FontWeight.w900, color: AppColors.accentDark)),
                        Text(_message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.inkSoft)),
                        const SizedBox(height: 22),
                        Row(children: [
                          _tile(Icons.check_rounded, '${result.correct}/${result.answered}', 'doğru', AppColors.mint),
                          const SizedBox(width: 10),
                          _tile(Icons.percent_rounded, '%${result.percent}', 'başarı', AppColors.sky),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          _tile(Icons.timer_rounded, _time, 'süre', AppColors.peach),
                          const SizedBox(width: 10),
                          _tile(Icons.bolt_rounded, '${result.bestStreak}', 'en iyi seri', AppColors.butter),
                        ]),
                        if (result.missed.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          Text('Tekrar edilecekler (${result.missed.length})',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 10),
                          for (final q in result.missed) _missed(q),
                        ],
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
                    child: Column(
                      children: [
                        ChunkyButton(
                          outlined: true,
                          color: AppColors.butter,
                          onTap: onAgain,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.replay_rounded, color: AppColors.ink),
                              const SizedBox(width: 8),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(againLabel,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        ChunkyButton(
                          outlined: true,
                          depth: 4,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          onTap: onHome,
                          child: const Text('Ana ekran',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String value, String label, Color color) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.ink, width: 2.5),
            boxShadow: const [BoxShadow(color: AppColors.ink, offset: Offset(0, 4))],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.ink, width: 2),
                ),
                child: Icon(icon, size: 20, color: AppColors.ink),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                    ),
                    Text(label,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.inkSoft)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _missed(Question q) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.ink, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(child: Text(q.prompt, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
              if (q.kind != QuestionKind.sentence)
                SpeakButton(text: q.kind == QuestionKind.wordTrEn ? q.correctText : q.prompt, size: 30),
            ]),
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.correct),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(q.correctText,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
                ),
              ],
            ),
          ],
        ),
      );
}

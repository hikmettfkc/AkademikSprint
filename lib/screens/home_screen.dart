import 'package:flutter/material.dart';

import '../models.dart';
import '../stats_store.dart';
import '../theme.dart';
import '../widgets/blob_background.dart';
import '../widgets/chunky_button.dart';
import 'feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.store});
  final StatsStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AnswerMode _answer = widget.store.answerMode;
  late ContentMode _content = widget.store.contentMode;

  Future<void> _start() async {
    widget.store
      ..answerMode = _answer
      ..contentMode = _content;
    await Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, _, _) =>
          FeedScreen(store: widget.store, answerMode: _answer, contentMode: _content),
      transitionsBuilder: (_, a, _, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
        child: child,
      ),
    ));
    if (mounted) setState(() {}); // istatistikleri tazele
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.store;
    return Scaffold(
      body: BlobBackground(
        color: AppColors.lavender,
        seed: 7,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
                children: [
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(text: 'Dil', style: TextStyle(color: AppColors.ink)),
                      TextSpan(text: 'Sprint', style: TextStyle(color: AppColors.accentDark)),
                    ]),
                    style: TextStyle(fontSize: 52, height: 1.05, fontWeight: FontWeight.w900, letterSpacing: -1),
                  ),
                  const SizedBox(height: 8),
                  const Text('YDS ve ALES için kaydır, bil, geç. Her gün biraz, her seferinde daha iyi.',
                      style: TextStyle(fontSize: 16, color: AppColors.inkSoft, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 22),
                  _statsRow(s),
                  const SizedBox(height: 26),
                  _sectionTitle('Nasıl cevaplamak istersin?'),
                  Row(children: [
                    Expanded(
                      child: _modeCard(
                        selected: _answer == AnswerMode.swipe,
                        color: AppColors.mint,
                        icon: Icons.swipe_rounded,
                        title: 'Kaydır',
                        subtitle: 'Kartı sağa ya da sola at',
                        onTap: () => setState(() => _answer = AnswerMode.swipe),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _modeCard(
                        selected: _answer == AnswerMode.tap,
                        color: AppColors.peach,
                        icon: Icons.touch_app_rounded,
                        title: 'Dokun',
                        subtitle: 'İki şıktan birine dokun',
                        onTap: () => setState(() => _answer = AnswerMode.tap),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 22),
                  _sectionTitle('Ne çalışalım?'),
                  _contentPicker(),
                  const SizedBox(height: 30),
                  ChunkyButton(
                    onTap: _start,
                    color: AppColors.accent,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Başla',
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                        SizedBox(width: 8),
                        Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
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

  Widget _sectionTitle(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 4),
        child: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
      );

  Widget _statsRow(StatsStore s) {
    Widget tile(String value, String label, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: AppColors.shade(color, 0.1), offset: const Offset(0, 4))],
            ),
            child: Column(children: [
              Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              Text(label,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
            ]),
          ),
        );
    return Row(children: [
      tile('${s.learnedCount}', 'öğrenilen', AppColors.butter),
      const SizedBox(width: 10),
      tile('${s.correct}', 'doğru', AppColors.sky),
      const SizedBox(width: 10),
      tile('${s.bestStreak}', 'en iyi seri', AppColors.blush),
    ]);
  }

  Widget _modeCard({
    required bool selected,
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ChunkyButton(
      onTap: onTap,
      color: selected ? color : Colors.white,
      borderColor: selected ? AppColors.shade(color, 0.25) : null,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selected ? Colors.white : color,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.ink),
            ),
            const Spacer(),
            Icon(selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                color: selected ? AppColors.ink : AppColors.inkSoft),
          ]),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          Text(subtitle,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.inkSoft)),
        ],
      ),
    );
  }

  Widget _contentPicker() {
    Widget chip(ContentMode m, String label) {
      final sel = _content == m;
      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _content = m),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: sel ? AppColors.accent : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: sel ? Colors.white : AppColors.inkSoft,
                )),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Row(children: [
        chip(ContentMode.words, 'Kelime'),
        chip(ContentMode.sentences, 'Cümle'),
        chip(ContentMode.mixed, 'Karışık'),
      ]),
    );
  }
}

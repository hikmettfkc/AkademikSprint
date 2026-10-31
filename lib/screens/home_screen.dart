import 'package:flutter/material.dart';

import '../models.dart';
import '../stats_store.dart';
import '../theme.dart';
import '../widgets/blob_background.dart';
import '../widgets/chunky_button.dart';
import '../widgets/logo_mark.dart';
import '../widgets/wordmark.dart';
import 'feed_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.store});
  final StatsStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AnswerMode _answer = widget.store.answerMode;
  late ContentMode _content = widget.store.contentMode;
  late Difficulty _difficulty = widget.store.difficulty;
  late int _sprint = widget.store.sprintLength;

  static final Map<Difficulty, int> _wordCounts = {
    for (final d in Difficulty.values) d: allWords.where((w) => d.includes(w.level)).length,
  };

  Future<void> _startReview() async {
    final n = widget.store.mistakes.length;
    if (n == 0) return;
    await Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, _, _) => FeedScreen(
        store: widget.store,
        answerMode: _answer,
        contentMode: ContentMode.mixed,
        difficulty: Difficulty.mixed,
        sprintLength: n < reviewSprintLength ? n : reviewSprintLength,
        review: true,
      ),
      transitionsBuilder: (_, a, _, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
        child: child,
      ),
    ));
    if (mounted) setState(() {});
  }

  Future<void> _start() async {
    widget.store
      ..answerMode = _answer
      ..contentMode = _content
      ..difficulty = _difficulty
      ..sprintLength = _sprint;
    await Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, _, _) => FeedScreen(
        store: widget.store,
        answerMode: _answer,
        contentMode: _content,
        difficulty: _difficulty,
        sprintLength: _sprint,
      ),
      transitionsBuilder: (_, a, _, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
        child: child,
      ),
    ));
    if (mounted) setState(() {}); // istatistikleri tazele
  }

  Future<void> _openSettings() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsScreen(store: widget.store)));
    if (mounted) setState(() {});
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
              child: Column(
                children: [
                  _header(),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                      children: [
                        _statsRow(s),
                        const SizedBox(height: 14),
                        _reviewCard(s.mistakes.length),
                        const SizedBox(height: 22),
                        _sectionTitle('Seviye'),
                        _segmented<Difficulty>(
                          values: Difficulty.values,
                          selected: _difficulty,
                          label: (d) => d.label,
                          sub: (d) => '${_wordCounts[d]}',
                          onTap: (d) => setState(() => _difficulty = d),
                        ),
                        const SizedBox(height: 18),
                        _sectionTitle('İçerik'),
                        _segmented<ContentMode>(
                          values: ContentMode.values,
                          selected: _content,
                          label: (c) => switch (c) {
                            ContentMode.words => 'Kelime',
                            ContentMode.sentences => 'Cümle',
                            ContentMode.mixed => 'Karışık',
                          },
                          onTap: (c) => setState(() => _content = c),
                        ),
                        const SizedBox(height: 18),
                        _sectionTitle('Sprint uzunluğu'),
                        _segmented<int>(
                          values: sprintOptions,
                          selected: _sprint,
                          label: sprintLabel,
                          sub: (_) => 'kart',
                          icon: (n) => n == 0 ? Icons.all_inclusive_rounded : null,
                          onTap: (n) => setState(() => _sprint = n),
                        ),
                        const SizedBox(height: 18),
                        _sectionTitle('Cevaplama'),
                        Row(children: [
                          Expanded(
                            child: _modeCard(AnswerMode.swipe, AppColors.mint, Icons.swipe_rounded, 'Kaydır',
                                'Kartı sağa ya da sola at'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _modeCard(AnswerMode.tap, AppColors.peach, Icons.touch_app_rounded, 'Dokun',
                                'İki şıktan birine dokun'),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
                    child: ChunkyButton(
                      outlined: true,
                      onTap: _start,
                      color: AppColors.accent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(_sprint == 0 ? 'Başla' : '$_sprint kartlık sprint',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 21, fontWeight: FontWeight.w900)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
                        ],
                      ),
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

  Widget _header() => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
        child: Row(
          children: [
            const LogoMark(size: 44),
            const SizedBox(width: 8),
            const Wordmark(size: 26),
            const Spacer(),
            Material(
              color: Colors.white,
              shape: const CircleBorder(side: BorderSide(color: AppColors.ink, width: 2)),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: _openSettings,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.settings_rounded, color: AppColors.ink),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _sectionTitle(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 4),
        child: Text(t, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.inkSoft)),
      );

  Widget _statsRow(StatsStore s) {
    Widget tile(String value, String label, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.ink, width: 2.5),
              boxShadow: const [BoxShadow(color: AppColors.ink, offset: Offset(0, 4))],
            ),
            child: Column(children: [
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              Text(label,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.inkSoft)),
            ]),
          ),
        );
    return Row(children: [
      tile('${s.learnedCount}', 'öğrenilen', AppColors.butter),
      const SizedBox(width: 10),
      tile('${s.dayStreak}', 'gün serisi', AppColors.sky),
      const SizedBox(width: 10),
      tile('${s.bestStreak}', 'en iyi seri', AppColors.blush),
    ]);
  }

  Widget _reviewCard(int count) {
    final has = count > 0;
    return ChunkyButton(
      outlined: true,
      depth: 5,
      color: has ? AppColors.peach : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      onTap: has ? _startReview : null,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.ink, width: 2),
          ),
          child: Icon(has ? Icons.replay_rounded : Icons.verified_rounded, color: AppColors.ink, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(has ? 'Hatalarım' : 'Hatalarım boş',
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
            Text(has ? '$count kelime ve cümle seni bekliyor' : 'Yanlış yaptıkların burada toplanır',
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
          ]),
        ),
        if (has)
          const Text('Tekrar et', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
        if (has) const Icon(Icons.chevron_right_rounded, color: AppColors.ink),
      ]),
    );
  }

  Widget _segmented<T>({
    required List<T> values,
    required T selected,
    required String Function(T) label,
    required ValueChanged<T> onTap,
    String Function(T)? sub,
    IconData? Function(T)? icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.ink, width: 2.5),
      ),
      child: Row(children: [
        for (final v in values)
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(v),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(vertical: sub == null ? 12 : 8),
                decoration: BoxDecoration(
                  color: v == selected ? AppColors.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: v == selected ? AppColors.ink : Colors.transparent, width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon?.call(v) case final i?)
                      Icon(i, size: 22, color: v == selected ? Colors.white : AppColors.inkSoft)
                    else
                      Text(label(v),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: v == selected ? Colors.white : AppColors.ink,
                          )),
                    if (sub != null)
                      Text(icon?.call(v) != null ? label(v) : sub(v),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                            color: v == selected ? Colors.white.withValues(alpha: 0.85) : AppColors.inkSoft,
                          )),
                  ],
                ),
              ),
            ),
          ),
      ]),
    );
  }

  Widget _modeCard(AnswerMode mode, Color color, IconData icon, String title, String subtitle) {
    final selected = _answer == mode;
    return ChunkyButton(
      outlined: true,
      depth: 5,
      onTap: () => setState(() => _answer = mode),
      color: selected ? color : Colors.white,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: selected ? Colors.white : color,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.ink, width: 2),
              ),
              child: Icon(icon, color: AppColors.ink, size: 22),
            ),
            const Spacer(),
            Icon(selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                color: AppColors.ink),
          ]),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
          Text(subtitle,
              style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
        ],
      ),
    );
  }
}

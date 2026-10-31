import 'package:flutter/material.dart';

import '../models.dart';
import '../stats_store.dart';
import '../theme.dart';
import '../widgets/blob_background.dart';
import '../widgets/chunky_button.dart';
import '../widgets/logo_mark.dart';
import '../widgets/question_card.dart';
import 'home_screen.dart';

/// Ilk acilista gosterilen 4 adimlik tanitim.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.store});
  final StatsStore store;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _pageCount = 4;
  final _pages = PageController();
  int _page = 0;

  Difficulty? _level;
  AnswerMode _mode = AnswerMode.swipe;
  int? _sprint;
  int? _demoPick;

  bool get _canContinue => switch (_page) {
        1 => _level != null,
        3 => _sprint != null,
        _ => true,
      };

  void _next() {
    if (!_canContinue) return;
    if (_page < _pageCount - 1) {
      _pages.nextPage(duration: const Duration(milliseconds: 380), curve: Curves.easeOutCubic);
    } else {
      _finish();
    }
  }

  void _back() => _pages.previousPage(duration: const Duration(milliseconds: 320), curve: Curves.easeOutCubic);

  void _finish() {
    final s = widget.store
      ..difficulty = _level ?? Difficulty.easy
      ..answerMode = _mode
      ..sprintLength = _sprint ?? 20
      ..onboardingDone = true;
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, _, _) => HomeScreen(store: s),
      transitionsBuilder: (_, a, _, child) => FadeTransition(opacity: a, child: child),
    ));
  }

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonText = switch (_page) {
      0 => 'Hadi başlayalım',
      3 => 'Bitir ve başla',
      _ => 'Devam',
    };
    return Scaffold(
      body: BlobBackground(
        color: AppColors.lavender,
        seed: 3,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                children: [
                  _header(),
                  Expanded(
                    child: PageView(
                      controller: _pages,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (p) => setState(() => _page = p),
                      children: [_welcome(), _levelPage(), _modePage(), _sprintPage()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _canContinue ? 1 : 0.45,
                      child: ChunkyButton(
                        outlined: true,
                        color: _canContinue ? AppColors.butter : Colors.white,
                        onTap: _canContinue ? _next : null,
                        child: Text(buttonText,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
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
        padding: const EdgeInsets.fromLTRB(12, 10, 20, 6),
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _page > 0 ? 1 : 0,
                child: IconButton(
                  onPressed: _page > 0 ? _back : null,
                  icon: const Icon(Icons.arrow_back_rounded, color: AppColors.ink),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Row(
                  children: [
                    for (var i = 0; i < _pageCount; i++) ...[
                      if (i > 0) const SizedBox(width: 6),
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 12,
                          decoration: BoxDecoration(
                            color: i <= _page ? AppColors.accent : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.ink, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _title(String title, String subtitle) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 28, height: 1.15, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text(subtitle,
              style: const TextStyle(fontSize: 16, color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
        ],
      );

  // 1. Karsilama
  Widget _welcome() => LayoutBuilder(
        builder: (context, c) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: c.maxHeight),
            child: IntrinsicHeight(child: _welcomeBody(c.maxHeight < 560 ? 150 : 220)),
          ),
        ),
      );

  Widget _welcomeBody(double logo) => Column(
          children: [
            const Spacer(),
            AnimatedLogoMark(size: logo),
            const SizedBox(height: 28),
            const Text('Kaydır, bil, geç.',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900)),
            const SizedBox(height: 12),
            const Text(
              'İngilizce kelimeleri oyun gibi çalış. Her kartta sadece iki şık var, '
              'yanlış yapmak da öğrenmenin bir parçası.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, height: 1.4, color: AppColors.inkSoft, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 6,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _tag(Icons.swipe_rounded, 'Kaydırmalı', AppColors.mint),
                _tag(Icons.timer_rounded, 'Günde 3 dk', AppColors.peach),
                _tag(Icons.lock_open_rounded, 'Ücretsiz', AppColors.sky),
              ],
            ),
            const Spacer(),
          ],
        );

  Widget _tag(IconData icon, String text, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.ink, width: 2),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: AppColors.ink),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
        ]),
      );

  // 2. Seviye
  Widget _levelPage() => ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        children: [
          _title('Seviyeni seç', 'Kolaydan başlamak her zaman iyi fikir. Sonra değiştirebilirsin.'),
          const SizedBox(height: 24),
          _option(
            selected: _level == Difficulty.easy,
            color: AppColors.mint,
            icon: Icons.eco_rounded,
            title: 'Kolay',
            subtitle: 'Sık kullanılan temel kelimelerle ısın',
            onTap: () => setState(() => _level = Difficulty.easy),
          ),
          _option(
            selected: _level == Difficulty.medium,
            color: AppColors.butter,
            icon: Icons.trending_up_rounded,
            title: 'Orta',
            subtitle: 'Okuma metinlerinde sık geçenler',
            onTap: () => setState(() => _level = Difficulty.medium),
          ),
          _option(
            selected: _level == Difficulty.hard,
            color: AppColors.blush,
            icon: Icons.local_fire_department_rounded,
            title: 'Zor',
            subtitle: 'İleri seviye, kendine meydan oku',
            onTap: () => setState(() => _level = Difficulty.hard),
          ),
        ],
      );

  Widget _option({
    required bool selected,
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: ChunkyButton(
        outlined: true,
        depth: 5,
        color: selected ? color : Colors.white,
        padding: const EdgeInsets.all(14),
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: selected ? Colors.white : color,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.ink, width: 2),
              ),
              child: Icon(icon, color: AppColors.ink),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 14, color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            AnimatedScale(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutBack,
              scale: selected ? 1 : 0,
              child: const Icon(Icons.check_circle_rounded, color: AppColors.ink, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  // 3. Cevaplama modu + canli deneme
  static const _demo = Question(
    itemId: 'demo',
    kind: QuestionKind.wordEnTr,
    prompt: 'rapid',
    options: ['hızlı', 'yavaş'],
    correctIndex: 0,
    colorIndex: 0,
  );

  Widget _modePage() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _title('Nasıl cevaplamak istersin?', 'Aşağıda hemen dene. İstediğin zaman değiştirebilirsin.'),
            const SizedBox(height: 18),
            Row(children: [
              Expanded(child: _modeTile(AnswerMode.swipe, Icons.swipe_rounded, 'Kaydır', AppColors.mint)),
              const SizedBox(width: 12),
              Expanded(child: _modeTile(AnswerMode.tap, Icons.touch_app_rounded, 'Dokun', AppColors.peach)),
            ]),
            const SizedBox(height: 14),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.ink, width: 2.5),
                ),
                clipBehavior: Clip.antiAlias,
                child: QuestionCard(
                  key: ValueKey('demo-$_mode'),
                  question: _demo,
                  mode: _mode,
                  picked: _demoPick,
                  onPick: (i) => setState(() => _demoPick = i),
                  showSwipeHint: true,
                  showNextHint: false,
                  showSpeaker: false,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _modeTile(AnswerMode mode, IconData icon, String title, Color color) {
    final sel = _mode == mode;
    return ChunkyButton(
      outlined: true,
      depth: 5,
      color: sel ? color : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      onTap: () => setState(() {
        _mode = mode;
        _demoPick = null;
      }),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.ink),
          const SizedBox(width: 8),
          Flexible(
            child: Text(title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }

  // 4. Sprint uzunlugu
  Widget _sprintPage() => ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        children: [
          _title('Bir sprint kaç kart olsun?', 'Sprint bitince sonucunu görürsün. Ana ekrandan her zaman değiştirebilirsin.'),
          const SizedBox(height: 24),
          _option(
            selected: _sprint == 20,
            color: AppColors.mint,
            icon: Icons.directions_walk_rounded,
            title: '20 kart',
            subtitle: 'Kısa ve hızlı · yaklaşık 3 dakika',
            onTap: () => setState(() => _sprint = 20),
          ),
          _option(
            selected: _sprint == 50,
            color: AppColors.butter,
            icon: Icons.directions_run_rounded,
            title: '50 kart',
            subtitle: 'Dengeli · yaklaşık 8 dakika',
            onTap: () => setState(() => _sprint = 50),
          ),
          _option(
            selected: _sprint == 100,
            color: AppColors.blush,
            icon: Icons.bolt_rounded,
            title: '100 kart',
            subtitle: 'Uzun soluklu · yaklaşık 15 dakika',
            onTap: () => setState(() => _sprint = 100),
          ),
        ],
      );
}

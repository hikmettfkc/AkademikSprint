import 'package:flutter/material.dart';

import '../stats_store.dart';
import '../theme.dart';
import '../widgets/logo_mark.dart';
import '../widgets/wordmark.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

/// Sistem acilis ekranindan (duz lavanta) sonra oynayan logo animasyonu.
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key, required this.store});
  final StatsStore store;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool _showName = false;

  void _onLogoDone() async {
    if (!mounted) return;
    await Future<void>.delayed(const Duration(milliseconds: 450));
    if (!mounted) return;
    final next = widget.store.onboardingDone
        ? HomeScreen(store: widget.store)
        : OnboardingScreen(store: widget.store);
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, _, _) => next,
      transitionsBuilder: (_, a, _, child) => FadeTransition(opacity: a, child: child),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedLogoMark(
              size: 230,
              delay: const Duration(milliseconds: 150),
              onDone: _onLogoDone,
            ),
            const SizedBox(height: 18),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _showName ? 1 : 0),
              duration: const Duration(milliseconds: 380),
              curve: Curves.easeOutBack,
              builder: (_, v, child) => Opacity(
                opacity: v.clamp(0.0, 1.0),
                child: Transform.translate(offset: Offset(0, 16 * (1 - v)), child: child),
              ),
              child: const Wordmark(size: 40),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 950), () {
      if (mounted) setState(() => _showName = true);
    });
  }
}

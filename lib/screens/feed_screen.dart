import 'dart:async';

import 'package:flutter/material.dart';

import '../models.dart';
import '../question_engine.dart';
import '../stats_store.dart';
import '../theme.dart';
import '../widgets/blob_background.dart';
import '../widgets/question_card.dart';

/// TikTok / Reels gibi dikey kaydirmali, sonsuz soru akisi.
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.store, required this.answerMode, required this.contentMode});

  final StatsStore store;
  final AnswerMode answerMode;
  final ContentMode contentMode;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final QuestionEngine _engine = QuestionEngine(content: widget.contentMode);
  final _controller = PageController();
  final List<Question> _questions = [];
  final Map<int, int> _picked = {};
  int _page = 0;
  int _streak = 0;
  int _sessionCorrect = 0;
  String? _toast;
  Timer? _advanceTimer;
  Timer? _toastTimer;
  late final bool _showSwipeHint = !widget.store.seenSwipeHint;

  Question _questionAt(int i) {
    while (_questions.length <= i) {
      _questions.add(_engine.next());
    }
    return _questions[i];
  }

  @override
  void dispose() {
    _advanceTimer?.cancel();
    _toastTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onPick(int index, int choice) {
    final q = _questions[index];
    final ok = choice == q.correctIndex;
    setState(() {
      _picked[index] = choice;
      if (ok) {
        _streak++;
        _sessionCorrect++;
      } else {
        _streak = 0;
        _engine.markWrong(q.itemId);
      }
    });
    widget.store.record(itemId: q.itemId, isCorrect: ok, streak: _streak);
    if (widget.answerMode == AnswerMode.swipe) widget.store.markSwipeHintSeen();

    if (ok && _streak > 0 && (_streak == 3 || _streak % 5 == 0)) {
      _showToast('$_streak doğru üst üste!');
    } else if (ok && _sessionCorrect % 10 == 0) {
      _showToast('Bu turda $_sessionCorrect doğru');
    }

    _advanceTimer?.cancel();
    _advanceTimer = Timer(Duration(milliseconds: ok ? 950 : 2200), () {
      if (!mounted || _page != index) return;
      _controller.nextPage(duration: const Duration(milliseconds: 420), curve: Curves.easeOutCubic);
    });
  }

  void _showToast(String text) {
    _toastTimer?.cancel();
    setState(() => _toast = text);
    _toastTimer = Timer(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => _toast = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (p) {
              _advanceTimer?.cancel();
              setState(() => _page = p);
            },
            itemBuilder: (context, i) {
              final q = _questionAt(i);
              final color = AppColors.cardColors[q.colorIndex];
              return ColoredBox(
                color: color,
                child: BlobBackground(
                  color: AppColors.shade(color, 0.04),
                  seed: i,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: QuestionCard(
                        key: ValueKey('q$i'),
                        question: q,
                        mode: widget.answerMode,
                        picked: _picked[i],
                        onPick: (c) => _onPick(i, c),
                        showSwipeHint: _showSwipeHint && i < 2,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SafeArea(child: _topBar()),
          SafeArea(child: _toastView()),
        ],
      ),
    );
  }

  Widget _topBar() => Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Row(
          children: [
            _circleButton(Icons.close_rounded, () => Navigator.of(context).pop()),
            const Spacer(),
            _pill(Icons.bolt_rounded, '$_streak', const Color(0xFFFFB86B)),
            const SizedBox(width: 8),
            _pill(Icons.check_rounded, '$_sessionCorrect', AppColors.correct),
          ],
        ),
      );

  Widget _circleButton(IconData icon, VoidCallback onTap) => Material(
        color: Colors.white.withValues(alpha: 0.9),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: AppColors.ink),
          ),
        ),
      );

  Widget _pill(IconData icon, String text, Color color) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 4),
            Text(text, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          ],
        ),
      );

  Widget _toastView() => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 260),
            transitionBuilder: (c, a) => SlideTransition(
              position: Tween(begin: const Offset(0, -0.6), end: Offset.zero).animate(a),
              child: FadeTransition(opacity: a, child: c),
            ),
            child: _toast == null
                ? const SizedBox.shrink()
                : Container(
                    key: ValueKey(_toast),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [BoxShadow(color: AppColors.accentDark, offset: Offset(0, 4))],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Text(_toast!,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                      ],
                    ),
                  ),
          ),
        ),
      );
}

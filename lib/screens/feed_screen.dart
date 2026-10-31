import 'dart:async';

import 'package:flutter/material.dart';

import '../feedback_fx.dart';
import '../models.dart';
import '../question_engine.dart';
import '../stats_store.dart';
import '../theme.dart';
import '../widgets/blob_background.dart';
import '../widgets/question_card.dart';
import 'sprint_summary.dart';

/// TikTok / Reels gibi dikey kaydirmali soru akisi.
/// [sprintLength] > 0 ise o kadar karttan sonra sprint sonu ekrani gelir; 0 ise sonsuzdur.
class FeedScreen extends StatefulWidget {
  const FeedScreen({
    super.key,
    required this.store,
    required this.answerMode,
    required this.contentMode,
    required this.difficulty,
    required this.sprintLength,
  });

  final StatsStore store;
  final AnswerMode answerMode;
  final ContentMode contentMode;
  final Difficulty difficulty;
  final int sprintLength;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final QuestionEngine _engine =
      QuestionEngine(content: widget.contentMode, difficulty: widget.difficulty);
  late final FeedbackFx _fx = FeedbackFx.of(widget.store);
  final _controller = PageController();
  final List<Question> _questions = [];
  final Map<int, int> _picked = {};
  final _started = DateTime.now();
  int _page = 0;
  int _streak = 0;
  int _bestStreak = 0;
  bool _finished = false;
  Duration _elapsed = Duration.zero;
  String? _toast;
  Timer? _advanceTimer;
  Timer? _toastTimer;
  late final bool _showSwipeHint = !widget.store.seenSwipeHint;

  bool get _isSprint => widget.sprintLength > 0;

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
        if (_streak > _bestStreak) _bestStreak = _streak;
      } else {
        _streak = 0;
        _engine.markWrong(q.itemId);
      }
    });
    ok ? _fx.correct() : _fx.wrong();
    widget.store.record(itemId: q.itemId, isCorrect: ok, streak: _streak);
    if (widget.answerMode == AnswerMode.swipe) widget.store.markSwipeHintSeen();

    if (ok && (_streak == 3 || _streak % 5 == 0)) {
      _showToast('$_streak doğru üst üste!');
    }

    _advanceTimer?.cancel();
    _advanceTimer = Timer(Duration(milliseconds: ok ? 950 : 2200), () {
      if (!mounted || _page != index) return;
      _controller.nextPage(duration: const Duration(milliseconds: 420), curve: Curves.easeOutCubic);
    });
  }

  void _onPageChanged(int p) {
    _advanceTimer?.cancel();
    setState(() => _page = p);
    if (_isSprint && p == widget.sprintLength && !_finished) {
      _finished = true;
      _elapsed = DateTime.now().difference(_started);
      widget.store.markSprintDone();
      _fx.sprintDone();
    }
  }

  void _showToast(String text) {
    _toastTimer?.cancel();
    setState(() => _toast = text);
    _toastTimer = Timer(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => _toast = null);
    });
  }

  void _again() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 380),
      pageBuilder: (_, _, _) => FeedScreen(
        store: widget.store,
        answerMode: widget.answerMode,
        contentMode: widget.contentMode,
        difficulty: widget.difficulty,
        sprintLength: widget.sprintLength,
      ),
      transitionsBuilder: (_, a, _, child) => FadeTransition(opacity: a, child: child),
    ));
  }

  SprintResult _result() {
    final missed = <Question>[];
    var correct = 0;
    _picked.forEach((i, c) {
      final q = _questions[i];
      if (c == q.correctIndex) {
        correct++;
      } else if (!missed.any((m) => m.itemId == q.itemId)) {
        missed.add(q);
      }
    });
    return SprintResult(
      total: widget.sprintLength,
      answered: _picked.length,
      correct: correct,
      bestStreak: _bestStreak,
      elapsed: _elapsed,
      missed: missed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final onSummary = _isSprint && _page >= widget.sprintLength;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            physics: onSummary ? const NeverScrollableScrollPhysics() : null,
            itemCount: _isSprint ? widget.sprintLength + 1 : null,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, i) {
              if (_isSprint && i == widget.sprintLength) {
                return SprintSummary(
                  result: _result(),
                  onAgain: _again,
                  onHome: () => Navigator.of(context).pop(),
                );
              }
              final q = _questionAt(i);
              final color = AppColors.cardColors[q.colorIndex];
              return ColoredBox(
                color: color,
                child: BlobBackground(
                  color: AppColors.shade(color, 0.04),
                  seed: i,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: _isSprint ? 76 : 56),
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
          if (!onSummary) SafeArea(child: _topBar()),
          SafeArea(child: _toastView()),
        ],
      ),
    );
  }

  Widget _topBar() => Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          children: [
            Row(
              children: [
                _circleButton(Icons.close_rounded, () => Navigator.of(context).pop()),
                const SizedBox(width: 12),
                if (_isSprint) Expanded(child: _progress()) else const Spacer(),
                const SizedBox(width: 12),
                _pill(Icons.bolt_rounded, '$_streak', const Color(0xFFFFA94D)),
              ],
            ),
          ],
        ),
      );

  Widget _progress() {
    final done = (_page).clamp(0, widget.sprintLength);
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.ink, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedFractionallySizedBox(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  widthFactor: done / widget.sprintLength,
                  heightFactor: 1,
                  child: const ColoredBox(color: AppColors.accent),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text('${done + 1}/${widget.sprintLength}',
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) => Material(
        color: Colors.white,
        shape: const CircleBorder(side: BorderSide(color: AppColors.ink, width: 2)),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: AppColors.ink),
          ),
        ),
      );

  Widget _pill(IconData icon, String text, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.ink, width: 2),
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
                      color: AppColors.butter,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColors.ink, width: 2.5),
                      boxShadow: const [BoxShadow(color: AppColors.ink, offset: Offset(0, 4))],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.auto_awesome_rounded, color: AppColors.ink, size: 20),
                        const SizedBox(width: 8),
                        Text(_toast!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                      ],
                    ),
                  ),
          ),
        ),
      );
}

import 'dart:math';

import 'package:flutter/material.dart';

import '../models.dart';
import '../theme.dart';
import 'chunky_button.dart';
import 'speak_button.dart';

const _praise = ['Harika!', 'Tam isabet!', 'Süpersin!', 'Çok iyi gidiyorsun!', 'Aynen böyle!', 'Bildin!'];
const _comfort = [
  'Sorun değil, artık biliyorsun.',
  'Bir dahakine kesin bilirsin.',
  'Az kaldı! Birazdan tekrar soracağız.',
  'Böyle böyle öğreniliyor.',
];

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.mode,
    required this.picked,
    required this.onPick,
    this.showSwipeHint = false,
    this.showNextHint = true,
    this.showSpeaker = true,
  });

  final Question question;
  final AnswerMode mode;
  final int? picked;
  final ValueChanged<int> onPick;
  final bool showSwipeHint;
  final bool showNextHint;
  final bool showSpeaker;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> with SingleTickerProviderStateMixin {
  double _dx = 0;
  bool _dragging = false;
  bool _compact = false;
  late final String _praiseText;
  late final String _comfortText;
  late final AnimationController _pop = AnimationController(vsync: this, duration: const Duration(milliseconds: 420));

  @override
  void initState() {
    super.initState();
    final r = Random(widget.question.hashCode);
    _praiseText = _praise[r.nextInt(_praise.length)];
    _comfortText = _comfort[r.nextInt(_comfort.length)];
  }

  @override
  void dispose() {
    _pop.dispose();
    super.dispose();
  }

  bool get _answered => widget.picked != null;

  void _pick(int i) {
    if (_answered) return;
    setState(() {
      _dx = 0;
      _dragging = false;
    });
    _pop.forward(from: 0);
    widget.onPick(i);
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.question;
    final base = AppColors.cardColors[q.colorIndex];
    return LayoutBuilder(
      builder: (context, c) {
        final width = c.maxWidth;
        final threshold = width * 0.22;
        // Kucuk alanlarda (onboarding denemesi, kisa telefonlar) daha sik yerlesim.
        _compact = c.maxHeight < 560;
        final gap = _compact ? 10.0 : 22.0;
        final padding = _compact ? const EdgeInsets.fromLTRB(14, 10, 14, 10) : const EdgeInsets.fromLTRB(20, 8, 20, 24);
        // Cok kisa ekranlarda tasmak yerine kaydirilabilir olsun; normalde bosluklar dagitilir.
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: (c.maxHeight - padding.vertical).clamp(0, double.infinity)),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Spacer(),
                  _labelPill(q.label, base),
                  SizedBox(height: _compact ? 8 : 14),
                  _promptCard(q, base, threshold),
                  SizedBox(height: gap),
                  if (widget.mode == AnswerMode.tap) ..._tapOptions(q) else _swipeOptions(q, threshold),
                  SizedBox(height: _compact ? 8 : 16),
                  SizedBox(height: _compact ? 46 : 56, child: _feedback(q)),
                  const Spacer(),
                  if (widget.showNextHint) _nextHint(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _labelPill(String text, Color base) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.85), borderRadius: BorderRadius.circular(40)),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.inkSoft, fontSize: 14),
    ),
  );

  Widget _promptCard(Question q, Color base, double threshold) {
    final isSentence = q.kind == QuestionKind.sentence;
    final tilt = (_dx / 900).clamp(-0.12, 0.12);
    final card = AnimatedBuilder(
      animation: _pop,
      builder: (context, child) {
        final t = _pop.value;
        final scale = 1 + 0.06 * sin(t * pi);
        return Transform.scale(scale: scale, child: child);
      },
      child: AnimatedContainer(
        duration: _dragging ? Duration.zero : const Duration(milliseconds: 260),
        curve: Curves.easeOutBack,
        transform: Matrix4.identity()
          ..translateByDouble(_dx, 0, 0, 1)
          ..rotateZ(tilt),
        transformAlignment: Alignment.bottomCenter,
        width: double.infinity,
        constraints: BoxConstraints(minHeight: _compact ? 96 : (isSentence ? 180 : 200)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: _compact ? 16 : 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.shade(base, 0.05), width: 3),
          boxShadow: [BoxShadow(color: AppColors.shade(base, 0.1), offset: const Offset(0, 8))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              q.prompt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSentence ? 21 : (q.prompt.length > 14 ? 30 : (_compact ? 34 : 40)),
                height: isSentence ? 1.4 : 1.15,
                fontWeight: isSentence ? FontWeight.w700 : FontWeight.w900,
                color: AppColors.ink,
              ),
            ),
            if (q.promptIsEnglish && widget.showSpeaker) ...[
              SizedBox(height: _compact ? 8 : 14),
              SpeakButton(text: q.prompt),
            ],
          ],
        ),
      ),
    );

    if (widget.mode != AnswerMode.swipe || _answered) return card;

    return GestureDetector(
      onHorizontalDragStart: (_) => setState(() => _dragging = true),
      onHorizontalDragUpdate: (d) => setState(() => _dx += d.delta.dx),
      onHorizontalDragEnd: (d) {
        final v = d.primaryVelocity ?? 0;
        if (_dx < -threshold || v < -900) {
          _pick(0);
        } else if (_dx > threshold || v > 900) {
          _pick(1);
        } else {
          setState(() {
            _dragging = false;
            _dx = 0;
          });
        }
      },
      child: card,
    );
  }

  Color _optionColor(int i, Question q) {
    if (!_answered) return Colors.white;
    if (i == q.correctIndex) return AppColors.correctSoft;
    if (i == widget.picked) return AppColors.wrongSoft;
    return Colors.white;
  }

  Color? _optionBorder(int i, Question q) {
    if (!_answered) return null;
    if (i == q.correctIndex) return AppColors.correct;
    if (i == widget.picked) return AppColors.wrong;
    return null;
  }

  List<Widget> _tapOptions(Question q) => [
    for (var i = 0; i < 2; i++) ...[
      if (i == 1) SizedBox(height: _compact ? 10 : 14),
      AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _answered && i != q.correctIndex && i != widget.picked ? 0.5 : 1,
        child: ChunkyButton(
          onTap: _answered ? null : () => _pick(i),
          color: _optionColor(i, q),
          borderColor: _optionBorder(i, q),
          child: _optionText(q.options[i], q, i),
        ),
      ),
    ],
  ];

  Widget _optionText(String text, Question q, int i) {
    final isSentence = q.kind == QuestionKind.sentence;
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: isSentence ? TextAlign.left : TextAlign.center,
            style: TextStyle(
              fontSize: isSentence ? 16 : 20,
              height: 1.3,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
        ),
        if (_answered && i == q.correctIndex && q.kind == QuestionKind.wordTrEn && widget.showSpeaker) ...[
          const SizedBox(width: 6),
          SpeakButton(text: text, size: 34),
        ],
        if (_answered && (i == q.correctIndex || i == widget.picked)) ...[
          const SizedBox(width: 8),
          Icon(
            i == q.correctIndex ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: i == q.correctIndex ? AppColors.correct : AppColors.wrong,
          ),
        ],
      ],
    );
  }

  Widget _swipeOptions(Question q, double threshold) {
    final leftGlow = !_answered && _dx < 0 ? (-_dx / threshold).clamp(0.0, 1.0) : 0.0;
    final rightGlow = !_answered && _dx > 0 ? (_dx / threshold).clamp(0.0, 1.0) : 0.0;
    Widget side(int i, double glow, bool left) {
      final arrow = Icon(
        left ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
        color: AppColors.accentDark,
        size: 22,
      );
      return Expanded(
        child: AnimatedScale(
          duration: const Duration(milliseconds: 120),
          scale: 1 + 0.06 * glow,
          child: ChunkyButton(
            onTap: _answered ? null : () => _pick(i),
            color: _answered ? _optionColor(i, q) : Color.lerp(Colors.white, AppColors.lavender, glow)!,
            borderColor: _answered ? _optionBorder(i, q) : (glow > 0.99 ? AppColors.accent : null),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_answered) arrow,
                if (!_answered) const SizedBox(height: 6),
                _optionText(q.options[i], q, i),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [side(0, leftGlow, true), const SizedBox(width: 12), side(1, rightGlow, false)],
        ),
        if (widget.showSwipeHint && !_answered) ...[
          SizedBox(height: _compact ? 8 : 14),
          const Text(
            'Kartı doğru cevaba doğru kaydır',
            style: TextStyle(color: AppColors.inkSoft, fontWeight: FontWeight.w700),
          ),
        ],
      ],
    );
  }

  Widget _feedback(Question q) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
      child: !_answered
          ? const SizedBox.shrink()
          : widget.picked == q.correctIndex
          ? _bubble(_praiseText, AppColors.correct, Icons.star_rounded)
          : _bubble(_comfortText, AppColors.accent, Icons.favorite_rounded),
    );
  }

  Widget _bubble(String text, Color color, IconData icon) => Container(
    key: ValueKey(text),
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
      ],
    ),
  );

  Widget _nextHint() => AnimatedOpacity(
    duration: const Duration(milliseconds: 300),
    opacity: _answered ? 1 : 0.0,
    child: const Column(
      children: [
        Icon(Icons.keyboard_arrow_up_rounded, color: AppColors.inkSoft, size: 30),
        Text(
          'Sıradaki için yukarı kaydır',
          style: TextStyle(color: AppColors.inkSoft, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

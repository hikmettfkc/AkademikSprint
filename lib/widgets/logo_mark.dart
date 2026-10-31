import 'dart:math';

import 'package:flutter/material.dart';

import '../theme.dart';

/// DilSprint logosu: iki kart + hiz cizgileri + simsek.
///
/// [progress] 0 -> 1 arasinda animasyonu oynatir; 1 iken statik logodur.
/// Cizim, ikon SVG'si ile ayni koordinat sisteminde (1024 birim) yapilir.
class LogoMark extends StatelessWidget {
  const LogoMark({super.key, this.size = 200, this.progress = 1});

  final double size;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _LogoPainter(progress)),
    );
  }
}

/// Logoyu kendi kendine bir kez oynatan surum.
class AnimatedLogoMark extends StatefulWidget {
  const AnimatedLogoMark({
    super.key,
    this.size = 200,
    this.duration = const Duration(milliseconds: 1300),
    this.delay = Duration.zero,
    this.onDone,
  });

  final double size;
  final Duration duration;
  final Duration delay;
  final VoidCallback? onDone;

  @override
  State<AnimatedLogoMark> createState() => _AnimatedLogoMarkState();
}

class _AnimatedLogoMarkState extends State<AnimatedLogoMark> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: widget.duration);

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) _c.forward().whenComplete(() => widget.onDone?.call());
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _c,
        builder: (_, _) => LogoMark(size: widget.size, progress: _c.value),
      );
}

class _LogoPainter extends CustomPainter {
  _LogoPainter(this.t);
  final double t;

  static const ink = AppColors.ink;
  static const stroke = 24.0;

  /// [t] icinde [a, b] araligini 0..1'e cevirir.
  double _seg(double a, double b) => ((t - a) / (b - a)).clamp(0.0, 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    // Sanat eseri yaklasik x: 90..830, y: 220..870 araliginda; merkezi (460, 545).
    final s = size.width / 820;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.scale(s);
    canvas.translate(-460, -545);

    final back = Curves.easeOutBack.transform(_seg(0.0, 0.42));
    final front = Curves.easeOutBack.transform(_seg(0.14, 0.58));
    final lines = Curves.easeOutCubic.transform(_seg(0.45, 0.78));
    final bolt = _seg(0.58, 0.95);

    // Hiz cizgileri: kartin kenarindan sola dogru uzar.
    if (lines > 0) {
      final p = Paint()
        ..color = ink
        ..strokeWidth = 26
        ..strokeCap = StrokeCap.round;
      for (final (y, x1) in [(420.0, 120.0), (520.0, 90.0), (620.0, 140.0)]) {
        canvas.drawLine(Offset(230 - (230 - x1) * lines, y), Offset(230, y), p);
      }
    }

    // Arka kart (nane yesili): soldan donerek gelir.
    if (back > 0) {
      _card(
        canvas,
        dx: (1 - back) * -760,
        angle: -12 + (1 - back) * -25,
        pivot: const Offset(560, 520),
        rect: const Rect.fromLTWH(330, 226, 420, 540),
        fill: AppColors.mint,
        opacity: _seg(0.0, 0.12),
      );
    }

    // On kart (beyaz): biraz gecikmeli gelip ustune oturur.
    if (front > 0) {
      _card(
        canvas,
        dx: (1 - front) * -760,
        angle: 7 + (1 - front) * -30,
        pivot: const Offset(590, 540),
        rect: const Rect.fromLTWH(380, 270, 420, 540),
        fill: Colors.white,
        opacity: _seg(0.14, 0.26),
        boltScale: bolt == 0 ? 0 : _pop(bolt),
      );
    }
    canvas.restore();
  }

  /// 0 -> 1.18 -> 1 "pat" efekti.
  double _pop(double x) {
    if (x < 0.6) return Curves.easeOut.transform(x / 0.6) * 1.18;
    return 1.18 - 0.18 * Curves.easeInOut.transform((x - 0.6) / 0.4);
  }

  void _card(
    Canvas canvas, {
    required double dx,
    required double angle,
    required Offset pivot,
    required Rect rect,
    required Color fill,
    required double opacity,
    double? boltScale,
  }) {
    canvas.save();
    canvas.translate(dx, 0);
    canvas.translate(pivot.dx, pivot.dy);
    canvas.rotate(angle * pi / 180);
    canvas.translate(-pivot.dx, -pivot.dy);

    final a = opacity.clamp(0.0, 1.0);
    final r = const Radius.circular(70);
    canvas.drawRRect(RRect.fromRectAndRadius(rect.shift(const Offset(0, 30)), r),
        Paint()..color = ink.withValues(alpha: a));
    final rr = RRect.fromRectAndRadius(rect, r);
    canvas.drawRRect(rr, Paint()..color = fill.withValues(alpha: a));
    canvas.drawRRect(
        rr,
        Paint()
          ..color = ink.withValues(alpha: a)
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke);

    if (boltScale != null && boltScale > 0) {
      final path = Path()
        ..moveTo(640, 360)
        ..lineTo(500, 570)
        ..lineTo(590, 570)
        ..lineTo(550, 730)
        ..lineTo(700, 500)
        ..lineTo(605, 500)
        ..close();
      const c = Offset(600, 545);
      canvas.save();
      canvas.translate(c.dx, c.dy);
      canvas.scale(boltScale);
      canvas.translate(-c.dx, -c.dy);
      canvas.drawPath(path, Paint()..color = const Color(0xFFFFD66B));
      canvas.drawPath(
          path,
          Paint()
            ..color = ink
            ..style = PaintingStyle.stroke
            ..strokeWidth = stroke
            ..strokeJoin = StrokeJoin.round);
      canvas.restore();
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_LogoPainter old) => old.t != t;
}

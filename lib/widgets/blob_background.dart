import 'dart:math';

import 'package:flutter/material.dart';

/// Arka planda yumusak pastel daireler ve noktalar.
class BlobBackground extends StatelessWidget {
  const BlobBackground({super.key, required this.color, this.seed = 0, required this.child});

  final Color color;
  final int seed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BlobPainter(color, seed),
      child: child,
    );
  }
}

class _BlobPainter extends CustomPainter {
  _BlobPainter(this.color, this.seed);
  final Color color;
  final int seed;

  @override
  void paint(Canvas canvas, Size size) {
    final rng = Random(seed);
    final paint = Paint()..color = color.withValues(alpha: 0.55);
    canvas.drawCircle(Offset(size.width * 0.95, size.height * 0.08), size.width * 0.32, paint);
    canvas.drawCircle(Offset(size.width * 0.02, size.height * 0.9), size.width * 0.38, paint);

    final dot = Paint()..color = color.withValues(alpha: 0.9);
    for (var i = 0; i < 7; i++) {
      final o = Offset(rng.nextDouble() * size.width, rng.nextDouble() * size.height);
      canvas.drawCircle(o, 3 + rng.nextDouble() * 5, dot);
    }
    final ring = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(size.width * 0.12, size.height * 0.2), 18, ring);
  }

  @override
  bool shouldRepaint(_BlobPainter old) => old.color != color || old.seed != seed;
}

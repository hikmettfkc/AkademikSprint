import 'package:flutter/material.dart';

import '../theme.dart';

/// Altinda "kalinlik" olan, basinca icine gocen oyun butonu.
class ChunkyButton extends StatefulWidget {
  const ChunkyButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color = AppColors.accent,
    this.depth = 6,
    this.radius = 22,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    this.borderColor,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final double depth;
  final double radius;
  final EdgeInsets padding;
  final Color? borderColor;

  @override
  State<ChunkyButton> createState() => _ChunkyButtonState();
}

class _ChunkyButtonState extends State<ChunkyButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final pressed = _down && widget.onTap != null;
    final offset = pressed ? widget.depth - 1 : 0.0;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _down = true),
      onTapCancel: () => setState(() => _down = false),
      onTapUp: (_) => setState(() => _down = false),
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(top: offset),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 80),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.radius),
            border: widget.borderColor == null ? null : Border.all(color: widget.borderColor!, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.shade(widget.color, 0.16),
                offset: Offset(0, widget.depth - offset),
              ),
            ],
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}

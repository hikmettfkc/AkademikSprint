import 'package:flutter/material.dart';

import '../speech.dart';
import '../theme.dart';

/// Ingilizce metni seslendiren kucuk yuvarlak buton.
class SpeakButton extends StatefulWidget {
  const SpeakButton({super.key, required this.text, this.size = 40});
  final String text;
  final double size;

  @override
  State<SpeakButton> createState() => _SpeakButtonState();
}

class _SpeakButtonState extends State<SpeakButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Telaffuzu dinle',
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: () => Speech.instance.say(widget.text),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: _pressed ? 0.88 : 1,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: AppColors.lavender,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.ink, width: 2),
            ),
            child: Icon(Icons.volume_up_rounded, size: widget.size * 0.52, color: AppColors.ink),
          ),
        ),
      ),
    );
  }
}

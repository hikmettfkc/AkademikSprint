import 'package:flutter/material.dart';

import '../theme.dart';

/// Iki renkli "DilSprint" yazisi.
class Wordmark extends StatelessWidget {
  const Wordmark({super.key, this.size = 52});
  final double size;

  @override
  Widget build(BuildContext context) => Text.rich(
        const TextSpan(children: [
          TextSpan(text: 'Dil', style: TextStyle(color: AppColors.ink)),
          TextSpan(text: 'Sprint', style: TextStyle(color: AppColors.accentDark)),
        ]),
        style: TextStyle(fontSize: size, height: 1.05, fontWeight: FontWeight.w900, letterSpacing: -1),
      );
}

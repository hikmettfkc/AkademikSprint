import 'package:flutter/material.dart';

/// Pastel, oyun hissi veren renk paleti. Bilincli olarak koyu mod yok.
class AppColors {
  static const background = Color(0xFFFFF8F0);
  static const ink = Color(0xFF2E2A4F);
  static const inkSoft = Color(0xFF6B6790);

  static const mint = Color(0xFFCDEFE3);
  static const lavender = Color(0xFFE3DBFA);
  static const peach = Color(0xFFFFDCC8);
  static const sky = Color(0xFFD4E9FA);
  static const butter = Color(0xFFFFF1B8);
  static const blush = Color(0xFFFADADD);

  static const correct = Color(0xFF4CC38A);
  static const correctSoft = Color(0xFFD5F5E5);
  static const wrong = Color(0xFFF2998F);
  static const wrongSoft = Color(0xFFFDE3E0);
  static const accent = Color(0xFF8C7CF0);
  static const accentDark = Color(0xFF6A5AD6);

  static const cardColors = [mint, lavender, peach, sky, butter, blush];

  /// Kartin rengine gore biraz daha koyu "golge" tonu (oyun butonu efekti).
  static Color shade(Color c, [double amount = 0.12]) {
    final hsl = HSLColor.fromColor(c);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }
}

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: Brightness.light,
      surface: AppColors.background,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    ),
  );
}

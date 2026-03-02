import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0F0F1A);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color accent = Color(0xFF6C63FF);
  static const Color accentAlt = Color(0xFFFF6B9D);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8B8FA8);
  static const Color success = Color(0xFF00D09C);
  static const Color warning = Color(0xFFFFB800);
  static const Color error = Color(0xFFFF4757);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentAlt],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0F0F1A), Color(0xFF1A1A2E), Color(0xFF0D0D1F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static BoxDecoration glassSurface({double radius = 16}) => BoxDecoration(
        color: surface.withAlpha(220),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white.withAlpha(20)),
      );
}

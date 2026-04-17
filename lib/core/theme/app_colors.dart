import 'package:flutter/material.dart';

abstract final class AppColors {
  // Backgrounds
  static const Color bgPrimary = Color(0xFF0D1117);
  static const Color bgSurface = Color(0xFF161B22);
  static const Color bgElevated = Color(0xFF1F2937);

  // Accents
  static const Color accentPrimary = Color(0xFF54C5F8);
  static const Color accentDeep = Color(0xFF0288D1);
  static const Color accentDart = Color(0xFFFF6E40);

  // Text
  static const Color textPrimary = Color(0xFFF0F6FC);
  static const Color textSecondary = Color(0xFF8B949E);
  static const Color textMuted = Color(0xFF484F58);

  // Borders
  static const Color borderSubtle = Color(0xFF21262D);
  static const Color borderAccent = Color(0xFF30363D);

  // Semantic
  static const Color success = Color(0xFF3FB950);
  static const Color error = Color(0xFFF85149);

  // Window chrome (macOS-style traffic lights)
  static const Color windowClose = Color(0xFFFF5F57);
  static const Color windowMinimize = Color(0xFFFFBD2E);
  static const Color windowMaximize = Color(0xFF28CA41);

  // Programming language accents
  static const Color languageKotlin = Color(0xFF7F52FF);
  static const Color languageSwift = Color(0xFFF05138);

  // Gradients
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF54C5F8),
      Color(0xFF0288D1),
      Color(0xFF01579B),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static const RadialGradient heroGlow = RadialGradient(
    center: Alignment.topRight,
    radius: 1.2,
    colors: [
      Color(0x1454C5F8), // 8% opacity accent-primary
      Colors.transparent,
    ],
  );

  static const LinearGradient sectionDivider = LinearGradient(
    colors: [
      Colors.transparent,
      Color(0xFF54C5F8),
      Colors.transparent,
    ],
  );
}

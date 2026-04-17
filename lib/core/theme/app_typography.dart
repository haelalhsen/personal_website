import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTypography {
  // Hero name — Playfair Display 80px/700
  static TextStyle heroName({Color color = AppColors.textPrimary}) =>
      GoogleFonts.playfairDisplay(
        fontSize: 80,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.05,
        letterSpacing: -1.5,
      );

  // Section title — Space Grotesk 42px/600
  static TextStyle sectionTitle({Color color = AppColors.textPrimary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.15,
        letterSpacing: -0.5,
      );

  // Hero subtitle / card title — Space Grotesk 22px/400
  static TextStyle heroSubtitle({Color color = AppColors.textSecondary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // Card title — Space Grotesk 20px/600
  static TextStyle cardTitle({Color color = AppColors.textPrimary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.3,
      );

  // Body — Inter 16px/400
  static TextStyle body({Color color = AppColors.textSecondary}) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.7,
      );

  // Body medium — Inter 16px/500
  static TextStyle bodyMedium({Color color = AppColors.textPrimary}) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.6,
      );

  // Caption — Inter 14px/400
  static TextStyle caption({Color color = AppColors.textMuted}) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.5,
      );

  // Navigation — Space Grotesk 14px/500
  static TextStyle navLink({Color color = AppColors.textSecondary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.2,
      );

  // Code / Tag / Section label — JetBrains Mono 13px/400
  static TextStyle mono({Color color = AppColors.accentPrimary}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.6,
      );

  // Section number label — JetBrains Mono 13px/400
  static TextStyle sectionLabel({Color color = AppColors.accentPrimary}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.5,
      );

  // Pull quote — Playfair Display italic 24px
  static TextStyle pullQuote({Color color = AppColors.textPrimary}) =>
      GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: color,
        height: 1.5,
      );

  // Stats number — Space Grotesk 36px/600
  static TextStyle statsNumber({Color color = AppColors.textPrimary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.1,
      );

  // Stats label — Inter 13px
  static TextStyle statsLabel({Color color = AppColors.textSecondary}) =>
      GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.3,
      );

  // Button — Space Grotesk 15px/600
  static TextStyle button({Color color = AppColors.bgPrimary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0.3,
      );

  // Tech chip — JetBrains Mono 13px default / 11px small
  static TextStyle chip({
    Color color = AppColors.accentPrimary,
    bool small = false,
  }) =>
      GoogleFonts.jetBrainsMono(
        fontSize: small ? 11 : 13,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // Availability badge text — JetBrains Mono 12px
  static TextStyle badgeText({Color color = AppColors.textSecondary}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // Micro mono (graph labels, tiny hints) — JetBrains Mono 10px
  static TextStyle monoMicro({Color color = AppColors.textMuted}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // Tiny mono (day-of-week labels) — JetBrains Mono 9px
  static TextStyle monoTiny({Color color = AppColors.textMuted}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 9,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // Skill symbol (tech stack small mono) — JetBrains Mono 11px
  static TextStyle skillSymbol({Color color = AppColors.textSecondary}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // Quote-mark decorator (large serif open quote) — Playfair Display 48px
  static TextStyle quoteMark({Color color = AppColors.accentPrimary}) =>
      GoogleFonts.playfairDisplay(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: color,
        height: 0.8,
      );

  // Project metric — Space Grotesk 24px/600
  static TextStyle metricValue({Color color = AppColors.textPrimary}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.1,
      );
}

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgPrimary,
        colorScheme: const ColorScheme.dark(
          surface: AppColors.bgSurface,
          primary: AppColors.accentPrimary,
          secondary: AppColors.accentDeep,
          tertiary: AppColors.accentDart,
          onPrimary: AppColors.bgPrimary,
          onSurface: AppColors.textPrimary,
          outline: AppColors.borderSubtle,
          error: AppColors.error,
        ),
        cardTheme: CardThemeData(
          color: AppColors.bgSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
            side: const BorderSide(color: AppColors.borderSubtle),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.borderSubtle,
          thickness: AppSpacing.dividerHeight,
        ),
        textTheme: TextTheme(
          displayLarge: AppTypography.heroName(),
          titleLarge: AppTypography.sectionTitle(),
          titleMedium: AppTypography.cardTitle(),
          bodyLarge: AppTypography.body(),
          bodyMedium: AppTypography.bodyMedium(),
          bodySmall: AppTypography.caption(),
          labelSmall: AppTypography.mono(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentPrimary,
            foregroundColor: AppColors.bgPrimary,
            textStyle: AppTypography.button(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.buttonPaddingH,
              vertical: AppSpacing.buttonPaddingV,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
            ),
            elevation: 0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.accentPrimary,
            textStyle: AppTypography.button(color: AppColors.accentPrimary),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.buttonPaddingH,
              vertical: AppSpacing.buttonPaddingV,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
            ),
            side: const BorderSide(color: AppColors.accentPrimary),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.bgSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
            borderSide: const BorderSide(color: AppColors.borderSubtle),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
            borderSide: const BorderSide(color: AppColors.borderSubtle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
            borderSide: const BorderSide(
              color: AppColors.accentPrimary,
              width: AppSpacing.borderFocus,
            ),
          ),
          labelStyle: AppTypography.caption(color: AppColors.textSecondary),
          hintStyle: AppTypography.body(color: AppColors.textMuted),
        ),
        useMaterial3: true,
      );
}

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: AppTypography.textTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.textLight,
        error: AppColors.errorLight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: AppTypography.textTheme,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textDark,
        error: AppColors.errorDark,
      ),
    );
  }
}

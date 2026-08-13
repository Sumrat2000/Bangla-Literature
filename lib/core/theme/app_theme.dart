import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

enum AppThemeMode { light, dark }

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      cardColor: AppColors.lightCard,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.h1(AppColors.lightTextPrimary),
        headlineMedium: AppTextStyles.h2(AppColors.lightTextPrimary),
        headlineSmall: AppTextStyles.h3(AppColors.lightTextPrimary),
        bodyLarge: AppTextStyles.bodyLarge(AppColors.lightTextPrimary),
        bodyMedium: AppTextStyles.body(AppColors.lightTextPrimary),
        bodySmall: AppTextStyles.bodySmall(AppColors.lightTextSecondary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightTextPrimary,
        elevation: 0,
        titleTextStyle: AppTextStyles.h3(AppColors.lightTextPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.06),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.zero,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        indicatorColor: AppColors.primary.withOpacity(0.12),
      ),
      dividerColor: Colors.black.withOpacity(0.06),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLight,
        brightness: Brightness.dark,
      ),
      cardColor: AppColors.darkCard,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.h1(AppColors.darkTextPrimary),
        headlineMedium: AppTextStyles.h2(AppColors.darkTextPrimary),
        headlineSmall: AppTextStyles.h3(AppColors.darkTextPrimary),
        bodyLarge: AppTextStyles.bodyLarge(AppColors.darkTextPrimary),
        bodyMedium: AppTextStyles.body(AppColors.darkTextPrimary),
        bodySmall: AppTextStyles.bodySmall(AppColors.darkTextSecondary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        titleTextStyle: AppTextStyles.h3(AppColors.darkTextPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.zero,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        indicatorColor: AppColors.primaryLight.withOpacity(0.20),
      ),
      dividerColor: Colors.white.withOpacity(0.08),
    );
  }
}

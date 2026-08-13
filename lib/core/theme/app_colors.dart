import 'package:flutter/material.dart';

/// Central color palette. All screens must reference colors from here —
/// never hardcode a Color(...) inside a widget.
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF1B5E4F); // deep teal-green
  static const Color primaryLight = Color(0xFF3E8E7E);
  static const Color accent = Color(0xFFC9A227); // muted gold, for "important"

  // Light theme
  static const Color lightBackground = Color(0xFFFAF8F4);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFF3EFE6);
  static const Color lightTextPrimary = Color(0xFF1E1E1E);
  static const Color lightTextSecondary = Color(0xFF5B5B5B);

  // Dark theme
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1C1C1C);
  static const Color darkCard = Color(0xFF232323);
  static const Color darkTextPrimary = Color(0xFFF2F2F2);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  // Reading mode (sepia, low glare)
  static const Color readingBackground = Color(0xFFF5ECD9);
  static const Color readingSurface = Color(0xFFFBF4E6);
  static const Color readingTextPrimary = Color(0xFF2E2A22);

  // Semantic
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFB8860B);
  static const Color error = Color(0xFFC0392B);

  // Source labels (see spec section 18)
  static const Color sourcePdf = Color(0xFF1B5E4F);
  static const Color sourceAiSupplementary = Color(0xFF7B5EA7);
  static const Color sourceVerified = Color(0xFF2E7D32);
  static const Color sourceExamImportant = Color(0xFFC9A227);

  // Weakness analysis
  static const Color strong = Color(0xFF2E7D32);
  static const Color medium = Color(0xFFB8860B);
  static const Color weak = Color(0xFFC0392B);
}

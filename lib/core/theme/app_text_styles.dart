import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Bengali typography needs a font with full Unicode coverage and
/// comfortable conjunct rendering. Noto Sans Bengali is used for UI/body
/// text; Noto Serif Bengali is offered for long-form "Reading Mode" text
/// (serif reads better for sustained paragraphs).
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    required Color color,
    double? height,
    bool serif = false,
  }) {
    final builder = serif ? GoogleFonts.notoSerifBengali : GoogleFonts.notoSansBengali;
    return builder(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height ?? 1.5, // comfortable line height per Reading UX rules
    );
  }

  // Headings
  static TextStyle h1(Color color) => _base(size: 26, weight: FontWeight.w700, color: color);
  static TextStyle h2(Color color) => _base(size: 22, weight: FontWeight.w700, color: color);
  static TextStyle h3(Color color) => _base(size: 18, weight: FontWeight.w600, color: color);

  // Body
  static TextStyle bodyLarge(Color color) => _base(size: 16, weight: FontWeight.w400, color: color, height: 1.6);
  static TextStyle body(Color color) => _base(size: 15, weight: FontWeight.w400, color: color, height: 1.6);
  static TextStyle bodySmall(Color color) => _base(size: 13, weight: FontWeight.w400, color: color);

  // Reading-mode long-form paragraph (serif, extra line height)
  static TextStyle reading(Color color) =>
      _base(size: 17, weight: FontWeight.w400, color: color, height: 1.8, serif: true);

  // Labels / badges (PDF Source, AI Supplementary, Exam Important, etc.)
  static TextStyle badge(Color color) => _base(size: 11, weight: FontWeight.w600, color: color, height: 1.2);

  // Card title (Timeline year, MCQ question)
  static TextStyle cardTitle(Color color) => _base(size: 16, weight: FontWeight.w600, color: color);

  static TextStyle caption(Color color) => _base(size: 12, weight: FontWeight.w400, color: color);
}

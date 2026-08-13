import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Renders the source-tracking badge required by spec section 18 — every
/// piece of content must visibly declare whether it's PDF-sourced,
/// AI-supplementary, verified, or still needs verification.
class SourceBadge extends StatelessWidget {
  final String sourceType; // matches SourceType enum name
  final bool examImportant;

  const SourceBadge({super.key, required this.sourceType, this.examImportant = false});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (sourceType) {
      'pdf' => ('📘 PDF Source', AppColors.sourcePdf),
      'aiSupplementary' => ('🤖 AI Supplementary', AppColors.sourceAiSupplementary),
      'verified' => ('🔎 Verified', AppColors.sourceVerified),
      _ => ('⚠️ Needs verification', AppColors.warning),
    };

    return Wrap(
      spacing: 6,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600)),
        ),
        if (examImportant)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.sourceExamImportant.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('⭐ Exam Important',
                style: TextStyle(fontSize: 11, color: AppColors.sourceExamImportant, fontWeight: FontWeight.w600)),
          ),
      ],
    );
  }
}

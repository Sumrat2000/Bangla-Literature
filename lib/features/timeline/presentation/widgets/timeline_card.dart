import 'package:flutter/material.dart';

import '../../../../data/models/timeline_entry.dart';

/// A single expandable timeline entry with the vertical connector line.
/// Tapping expands in place with a smooth height/fade animation — no
/// flashy transitions per spec section 6 ("অতিরিক্ত flashy animation
/// ব্যবহার করবে না").
class TimelineCard extends StatelessWidget {
  final TimelineEntry entry;
  final bool isExpanded;
  final bool isLast;
  final VoidCallback onTap;

  const TimelineCard({
    super.key,
    required this.entry,
    required this.isExpanded,
    required this.isLast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Connector column: year dot + vertical line
          SizedBox(
            width: 56,
            child: Column(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${entry.year}'.substring(2), // last 2 digits for compact dot
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: theme.dividerColor),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Card content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${entry.year}', style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary, fontWeight: FontWeight.w700)),
                            if (entry.examImportant) ...[
                              const SizedBox(width: 6),
                              const Icon(Icons.star, size: 14, color: Color(0xFFC9A227)),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(entry.title, style: theme.textTheme.headlineSmall),
                        const SizedBox(height: 4),
                        Text(entry.shortInfo, style: theme.textTheme.bodySmall),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeInOut,
                          child: isExpanded
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 220),
                                    opacity: isExpanded ? 1 : 0,
                                    child: Text(entry.detailedInfo, style: theme.textTheme.bodyMedium),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

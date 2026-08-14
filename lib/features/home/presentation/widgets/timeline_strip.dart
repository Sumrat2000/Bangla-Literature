import 'package:flutter/material.dart';

import '../../../../data/models/timeline_entry.dart';

class TimelineHighlightStrip extends StatelessWidget {
  final List<TimelineEntry> entries;
  final VoidCallback onTapEntry;

  const TimelineHighlightStrip({super.key, required this.entries, required this.onTapEntry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (entries.isEmpty) {
      return Text('Timeline এখনো খালি', style: theme.textTheme.bodySmall);
    }

    return SizedBox(
      height: 92,
      child: Stack(
        children: [
          // Connecting line, vertically centered behind the row of nodes.
          Positioned(
            left: 24,
            right: 24,
            top: 22,
            child: Container(height: 2, color: theme.dividerColor),
          ),
          ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(width: 22),
            itemBuilder: (context, i) {
              final e = entries[i];
              return InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: onTapEntry,
                child: SizedBox(
                  width: 96,
                  child: Column(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: theme.scaffoldBackgroundColor, width: 3),
                        ),
                        child: Text(
                          '${e.year}',
                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        e.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

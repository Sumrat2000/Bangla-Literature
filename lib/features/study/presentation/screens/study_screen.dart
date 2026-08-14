import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import 'chapter_topics_screen.dart';

const _eraIcons = {
  'প্রাচীন যুগ': Icons.history_edu_outlined,
  'অন্ধকার যুগ': Icons.nights_stay_outlined,
  'মধ্যযুগ': Icons.account_balance_outlined,
  'আধুনিক যুগ': Icons.auto_stories_outlined,
  'অন্যান্য': Icons.category_outlined,
};

/// Study screen — topics grouped into "chapters" by era, each showing real
/// read-progress (X/Y পড়া হয়েছে). Tapping a chapter opens its topic list;
/// tapping a topic opens the structured reading view (spec section 5).
class StudyScreen extends ConsumerWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final groupsAsync = ref.watch(chapterGroupsProvider);

    return groupsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('তথ্য লোড করা যায়নি: $err')),
      data: (groups) {
        if (groups.isEmpty) {
          return const Center(child: Text('এখনো কোনো topic যোগ করা হয়নি।'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: groups.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, i) {
            final g = groups[i];
            final progress = g.items.isEmpty ? 0.0 : g.readCount / g.items.length;
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ChapterTopicsScreen(era: g.era, items: g.items)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
                        child: Icon(_eraIcons[g.era] ?? Icons.menu_book_outlined, color: theme.colorScheme.primary),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(g.era, style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 4),
                            Text('${g.items.length}টি টপিক', style: theme.textTheme.bodySmall),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 6,
                                backgroundColor: theme.dividerColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('${g.readCount}/${g.items.length} পড়া হয়েছে', style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

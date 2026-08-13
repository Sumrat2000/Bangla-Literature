import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import '../widgets/home_section_card.dart';
import '../widgets/empty_state.dart';

/// Home screen — spec section 4. Sections with real data wired in
/// (topic count, MCQ count, timeline highlights); revision/progress
/// sections stay as empty states until spaced repetition (Phase 9) exists.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final topicsAsync = ref.watch(topicListProvider);
    final mcqsAsync = ref.watch(mcqListProvider);
    final timelineAsync = ref.watch(timelineEntriesProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        HomeSectionCard(
          title: 'আজকের পড়াশোনা',
          icon: Icons.today_outlined,
          child: topicsAsync.when(
            data: (topics) => mcqsAsync.when(
              data: (mcqs) => Text(
                '${topics.length}টি topic  ·  ${mcqs.length}টি MCQ প্রস্তুত',
                style: theme.textTheme.bodyMedium,
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, s) => Text('লোড ব্যর্থ: $e', style: theme.textTheme.bodySmall),
            ),
            loading: () => const LinearProgressIndicator(),
            error: (e, s) => Text('লোড ব্যর্থ: $e', style: theme.textTheme.bodySmall),
          ),
        ),
        const SizedBox(height: 12),
        HomeSectionCard(
          title: 'Timeline Highlights',
          icon: Icons.timeline_outlined,
          child: timelineAsync.when(
            data: (entries) {
              if (entries.isEmpty) {
                return const EmptyState(message: 'Timeline এখনো খালি');
              }
              final sorted = [...entries]..sort((a, b) => a.year.compareTo(b.year));
              final highlights = sorted.take(3).toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final e in highlights)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text('${e.year} — ${e.title}', style: theme.textTheme.bodyMedium),
                    ),
                ],
              );
            },
            loading: () => const LinearProgressIndicator(),
            error: (e, s) => Text('লোড ব্যর্থ: $e', style: theme.textTheme.bodySmall),
          ),
        ),
        const SizedBox(height: 12),
        const HomeSectionCard(
          title: 'গুরুত্বপূর্ণ তথ্য',
          icon: Icons.star_outline,
          child: EmptyState(message: 'Topic-এর ভেতরে ⭐ চিহ্নিত তথ্যগুলো এখানে যুক্ত হবে (পরবর্তী ধাপ)'),
        ),
        const SizedBox(height: 12),
        const HomeSectionCard(
          title: 'Revision Due',
          icon: Icons.refresh,
          child: EmptyState(message: 'Spaced repetition এখনো চালু হয়নি'),
        ),
        const SizedBox(height: 12),
        const HomeSectionCard(
          title: 'Progress',
          icon: Icons.bar_chart_outlined,
          child: EmptyState(message: 'অগ্রগতি ট্র্যাক করা শুরু হয়নি'),
        ),
      ],
    );
  }
}

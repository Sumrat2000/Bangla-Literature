import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import '../../../home/presentation/widgets/empty_state.dart';

/// Real progress only — every number here is computed from actual reading/
/// practice activity in the database (spec section 15, 28). Topics never
/// opened or practiced simply don't appear in the weak/strong lists yet,
/// rather than showing an invented percentage.
class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final topicsAsync = ref.watch(topicListProvider);
    final readIdsAsync = ref.watch(readTopicIdsProvider);
    final progressAsync = ref.watch(topicProgressProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('সামগ্রিক অগ্রগতি', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 10),
        topicsAsync.when(
          data: (topics) => readIdsAsync.when(
            data: (readIds) {
              final total = topics.length;
              final read = readIds.length;
              final pct = total == 0 ? 0.0 : read / total;
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 72,
                        height: 72,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: pct,
                              strokeWidth: 7,
                              backgroundColor: theme.dividerColor,
                              color: theme.colorScheme.primary,
                            ),
                            Text('${(pct * 100).round()}%', style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text('$read / $total টপিক পড়া হয়েছে', style: theme.textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Text('লোড ব্যর্থ: $e'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Text('লোড ব্যর্থ: $e'),
        ),
        const SizedBox(height: 20),

        Text('MCQ পারফরম্যান্স (টপিক অনুযায়ী)', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 10),
        topicsAsync.when(
          data: (topics) => progressAsync.when(
            data: (rows) {
              final titleById = {for (final t in topics) t.id: t.title};
              final practiced = rows.where((r) => r.correctCount + r.wrongCount > 0).toList()
                ..sort((a, b) {
                  final accA = a.correctCount / (a.correctCount + a.wrongCount);
                  final accB = b.correctCount / (b.correctCount + b.wrongCount);
                  return accA.compareTo(accB); // weakest first
                });

              if (practiced.isEmpty) {
                return const EmptyState(message: 'এখনো কোনো MCQ অনুশীলন করা হয়নি');
              }

              return Column(
                children: [
                  for (final r in practiced)
                    _TopicAccuracyRow(
                      title: titleById[r.contentItemId] ?? r.contentItemId,
                      correct: r.correctCount,
                      wrong: r.wrongCount,
                    ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Text('লোড ব্যর্থ: $e'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Text('লোড ব্যর্থ: $e'),
        ),
        const SizedBox(height: 20),
        const HomeSectionPlaceholder(),
      ],
    );
  }
}

class _TopicAccuracyRow extends StatelessWidget {
  final String title;
  final int correct;
  final int wrong;

  const _TopicAccuracyRow({required this.title, required this.correct, required this.wrong});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = correct + wrong;
    final acc = total == 0 ? 0.0 : correct / total;
    final color = acc >= 0.7 ? Colors.green : (acc >= 0.4 ? Colors.orange : Colors.red);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: theme.textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis)),
              Text('$correct/$total সঠিক', style: theme.textTheme.bodySmall?.copyWith(color: color)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(value: acc, minHeight: 6, backgroundColor: theme.dividerColor, color: color),
          ),
        ],
      ),
    );
  }
}

/// Placeholder note for streaks/spaced-repetition — kept explicit rather
/// than silently omitted, so it's clear this is intentionally deferred.
class HomeSectionPlaceholder extends StatelessWidget {
  const HomeSectionPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.local_fire_department_outlined, size: 18, color: theme.colorScheme.outline),
            const SizedBox(width: 8),
            Expanded(
              child: Text('Study streak ও spaced-repetition এখনো তৈরি হয়নি', style: theme.textTheme.bodySmall),
            ),
          ],
        ),
      ),
    );
  }
}

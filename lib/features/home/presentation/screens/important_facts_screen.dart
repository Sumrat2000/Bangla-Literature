import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import '../widgets/empty_state.dart';

/// Every fact flagged ⭐ exam-important, across all topics — a fast
/// "একনজরে" revision surface pulled straight from real content, not a
/// separately hand-curated list (spec section 2: derive views, don't
/// duplicate content).
class ImportantFactsScreen extends ConsumerWidget {
  const ImportantFactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final factsAsync = ref.watch(examImportantFactsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('গুরুত্বপূর্ণ তথ্য')),
      body: factsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('লোড করা যায়নি: $err')),
        data: (facts) {
          if (facts.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: EmptyState(icon: Icons.star_outline, message: 'এখনো কোনো তথ্য ⭐ চিহ্নিত করা হয়নি'),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: facts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final f = facts[i];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.star, size: 18, color: Color(0xFFC9A227)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.itemTitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary)),
                            const SizedBox(height: 2),
                            Text(f.label, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                            Text(f.value, style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

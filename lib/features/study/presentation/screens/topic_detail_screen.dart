import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/database/app_database.dart';
import '../../../../data/providers.dart';
import '../widgets/source_badge.dart';

/// Bundles the three repository queries backing this screen so their
/// concrete row types (ContentItemRow / ContentSectionRow / ContentFactRow)
/// survive the async gap instead of being erased to Object by a mixed-type
/// Future.wait([...]) list literal.
class _TopicDetailData {
  final ContentItemRow? item;
  final List<ContentSectionRow> sections;
  final List<ContentFactRow> facts;

  _TopicDetailData({required this.item, required this.sections, required this.facts});
}

/// Structured reading view for a single topic/person/book (spec section 5):
/// short summary, detailed sections, and a quick-facts list — all pulled
/// straight from the database rather than duplicated anywhere.
class TopicDetailScreen extends ConsumerWidget {
  final String contentItemId;
  final String title;

  const TopicDetailScreen({super.key, required this.contentItemId, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(contentRepositoryProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<_TopicDetailData>(
        future: () async {
          final item = await repo.getById(contentItemId);
          final sections = await repo.getSections(contentItemId);
          final facts = await repo.getFacts(contentItemId);
          return _TopicDetailData(item: item, sections: sections, facts: facts);
        }(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final item = snapshot.data!.item;
          final sections = snapshot.data!.sections;
          final facts = snapshot.data!.facts;

          if (item == null) {
            return const Center(child: Text('তথ্য পাওয়া যায়নি'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Expanded(child: Text(item.shortDescription, style: theme.textTheme.bodyLarge)),
                ],
              ),
              const SizedBox(height: 8),
              SourceBadge(sourceType: item.sourceType, examImportant: item.examImportant),
              const SizedBox(height: 20),

              if (facts.isNotEmpty) ...[
                Text('এক নজরে (Quick Facts)', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        for (final f in facts)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: Text(f.label, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                                ),
                                Expanded(child: Text(f.value, style: theme.textTheme.bodyMedium)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              if (sections.isNotEmpty) ...[
                Text('বিস্তারিত', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 8),
                for (final s in sections)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.heading, style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 6),
                            Text(s.body, style: theme.textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}

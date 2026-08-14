import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/database/app_database.dart';
import '../../../../data/providers.dart';
import 'topic_detail_screen.dart';

const _typeIcons = {
  'person': Icons.person_outline,
  'book': Icons.menu_book_outlined,
  'topic': Icons.category_outlined,
};

class ChapterTopicsScreen extends ConsumerWidget {
  final String era;
  final List<ContentItemRow> items;

  const ChapterTopicsScreen({super.key, required this.era, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final readIdsAsync = ref.watch(readTopicIdsProvider);
    final readIds = readIdsAsync.maybeWhen(data: (s) => s, orElse: () => <String>{});

    return Scaffold(
      appBar: AppBar(title: Text(era)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final t = items[i];
          final isRead = readIds.contains(t.id);
          return Card(
            child: ListTile(
              leading: Icon(_typeIcons[t.type] ?? Icons.article_outlined),
              title: Text(t.title),
              subtitle: Text(t.shortDescription, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: isRead
                  ? const Icon(Icons.check_circle, color: Colors.green, size: 20)
                  : const Icon(Icons.chevron_right),
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => TopicDetailScreen(contentItemId: t.id, title: t.title)),
                );
                ref.invalidate(readTopicIdsProvider);
                ref.invalidate(chapterGroupsProvider);
              },
            ),
          );
        },
      ),
    );
  }
}

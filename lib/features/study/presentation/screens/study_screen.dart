import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import 'topic_detail_screen.dart';

/// Topic list — tapping a topic opens the structured reading view
/// (spec section 5). Backed by the real content database.
class StudyScreen extends ConsumerWidget {
  const StudyScreen({super.key});

  static const _typeLabels = {
    'person': 'ব্যক্তি',
    'book': 'গ্রন্থ',
    'topic': 'বিষয়',
    'event': 'ঘটনা',
    'institution': 'প্রতিষ্ঠান',
    'magazine': 'পত্রিকা',
    'award': 'পুরস্কার',
    'literaryMovement': 'সাহিত্য আন্দোলন',
  };

  static const _typeIcons = {
    'person': Icons.person_outline,
    'book': Icons.menu_book_outlined,
    'topic': Icons.category_outlined,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(topicListProvider);

    return topicsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('তথ্য লোড করা যায়নি: $err')),
      data: (topics) {
        if (topics.isEmpty) {
          return const Center(child: Text('এখনো কোনো topic যোগ করা হয়নি।'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: topics.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final t = topics[i];
            return Card(
              child: ListTile(
                leading: Icon(_typeIcons[t.type] ?? Icons.article_outlined),
                title: Text(t.title),
                subtitle: Text(
                  t.shortDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Wrap(
                  spacing: 4,
                  children: [
                    if (t.examImportant) const Icon(Icons.star, size: 16, color: Color(0xFFC9A227)),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => TopicDetailScreen(contentItemId: t.id, title: t.title)),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

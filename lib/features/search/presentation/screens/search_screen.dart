import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import '../../../home/presentation/widgets/empty_state.dart';
import '../../../study/presentation/screens/topic_detail_screen.dart';

/// Global search across persons, books, topics, and events (spec section
/// 16) — matches on title/short description. Year-only search and MCQ
/// search are natural follow-ups once more content packs are ingested.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'ব্যক্তি, গ্রন্থ, বিষয় খুঁজুন...',
            border: InputBorder.none,
          ),
          onChanged: (v) => ref.read(searchQueryProvider.notifier).state = v,
        ),
      ),
      body: results.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('অনুসন্ধানে সমস্যা হয়েছে: $err')),
        data: (items) {
          if (ref.read(searchQueryProvider).trim().isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: EmptyState(icon: Icons.search, message: 'খোঁজার জন্য টাইপ করুন'),
              ),
            );
          }
          if (items.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: EmptyState(icon: Icons.search_off, message: 'কোনো ফলাফল পাওয়া যায়নি'),
              ),
            );
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final t = items[i];
              return ListTile(
                title: Text(t.title),
                subtitle: Text(t.shortDescription, maxLines: 1, overflow: TextOverflow.ellipsis),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => TopicDetailScreen(contentItemId: t.id, title: t.title)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

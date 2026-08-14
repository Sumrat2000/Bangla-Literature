import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../data/providers.dart';
import '../../../practice/presentation/screens/mcq_practice_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../widgets/hero_highlight_carousel.dart';
import '../widgets/menu_grid.dart';
import '../widgets/stat_chip.dart';
import '../widgets/streak_revision_row.dart';
import '../widgets/timeline_strip.dart';
import 'important_facts_screen.dart';

/// Home screen — spec section 4, redesigned to match the reference layout:
/// hero highlight banner, today's-study stat chips, an 8-tile icon menu,
/// streak/revision cards, and a horizontal timeline strip. Every number
/// shown is real (from the database) or an honest "not tracked yet" —
/// nothing here is a placeholder statistic dressed up as real data.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _goToTab(WidgetRef ref, int index) {
    ref.read(selectedTabIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final topicsAsync = ref.watch(topicListProvider);
    final mcqsAsync = ref.watch(mcqListProvider);
    final timelineAsync = ref.watch(timelineEntriesProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(topicListProvider);
        ref.invalidate(mcqListProvider);
        ref.invalidate(timelineEntriesProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- Hero banner: real highlights, not invented quotes ---
          timelineAsync.when(
            data: (entries) {
              final highlights = entries.where((e) => e.examImportant).toList()..sort((a, b) => a.year.compareTo(b.year));
              final texts = (highlights.isEmpty ? entries : highlights)
                  .take(5)
                  .map((e) => '${e.year} — ${e.title}')
                  .toList();
              return HeroHighlightCarousel(highlights: texts);
            },
            loading: () => const HeroHighlightCarousel(highlights: []),
            error: (e, s) => const HeroHighlightCarousel(highlights: []),
          ),
          const SizedBox(height: 20),

          // --- আজকের পড়াশোনা ---
          Text('আজকের পড়াশোনা', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 10),
          topicsAsync.when(
            data: (topics) => mcqsAsync.when(
              data: (mcqs) => Consumer(
                builder: (context, ref, _) {
                  final progressAsync = ref.watch(topicProgressProvider);
                  final weakCount = progressAsync.maybeWhen(
                    data: (rows) => rows
                        .where((r) => r.correctCount + r.wrongCount >= 3)
                        .where((r) => r.correctCount / (r.correctCount + r.wrongCount) < 0.5)
                        .length,
                    orElse: () => null,
                  );
                  return StatChipsRow(chips: [
                    StatChip(icon: Icons.menu_book_outlined, color: AppColors.tileRead, value: '${topics.length}', label: 'Topic'),
                    StatChip(icon: Icons.quiz_outlined, color: AppColors.tileMcq, value: '${mcqs.length}', label: 'MCQ প্রস্তুত'),
                    const StatChip(icon: Icons.refresh, color: AppColors.tileTimeline, value: '—', label: 'রিভিশন (শীঘ্রই)'),
                    StatChip(
                      icon: Icons.trending_down,
                      color: AppColors.weak,
                      value: weakCount == null ? '—' : '$weakCount',
                      label: 'দুর্বল টপিক',
                    ),
                  ]);
                },
              ),
              loading: () => const SizedBox(height: 96, child: Center(child: CircularProgressIndicator())),
              error: (e, s) => Text('লোড ব্যর্থ: $e', style: theme.textTheme.bodySmall),
            ),
            loading: () => const SizedBox(height: 96, child: Center(child: CircularProgressIndicator())),
            error: (e, s) => Text('লোড ব্যর্থ: $e', style: theme.textTheme.bodySmall),
          ),
          const SizedBox(height: 24),

          // --- Icon-grid menu ---
          MenuGrid(tiles: [
            MenuGridTile(
              icon: Icons.menu_book,
              color: AppColors.tileRead,
              title: 'পড়ুন',
              subtitle: 'সাহিত্য পড়ুন',
              onTap: () => _goToTab(ref, 2),
            ),
            MenuGridTile(
              icon: Icons.timeline,
              color: AppColors.tileTimeline,
              title: 'টাইমলাইন',
              subtitle: 'ইতিহাস',
              onTap: () => _goToTab(ref, 1),
            ),
            MenuGridTile(
              icon: Icons.psychology_alt_outlined,
              color: AppColors.tileMemory,
              title: 'মুখস্থ করুন',
              subtitle: 'সহজে মনে রাখুন',
              onTap: () => _goToTab(ref, 3),
            ),
            MenuGridTile(
              icon: Icons.assignment_outlined,
              color: AppColors.tileMcq,
              title: 'MCQ',
              subtitle: 'প্র্যাকটিস',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const McqPracticeScreen())),
            ),
            MenuGridTile(
              icon: Icons.edit_note_outlined,
              color: AppColors.tileExam,
              title: 'পরীক্ষা দিন',
              subtitle: 'যাচাই করুন',
              onTap: () => _goToTab(ref, 3),
            ),
            MenuGridTile(
              icon: Icons.search,
              color: AppColors.tileSearch,
              title: 'দ্রুত খুঁজুন',
              subtitle: 'সহজে পান',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchScreen())),
            ),
            MenuGridTile(
              icon: Icons.star_outline,
              color: AppColors.tileImportant,
              title: 'গুরুত্বপূর্ণ তথ্য',
              subtitle: 'এক নজরে',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ImportantFactsScreen())),
            ),
            MenuGridTile(
              icon: Icons.insights_outlined,
              color: AppColors.tileProgress,
              title: 'আমার অগ্রগতি',
              subtitle: 'পারফরম্যান্স',
              onTap: () => _goToTab(ref, 4),
            ),
          ]),
          const SizedBox(height: 24),

          // --- Streak + Revision Due ---
          const StreakRevisionRow(),
          const SizedBox(height: 24),

          // --- Timeline highlights strip ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('টাইমলাইন হাইলাইটস', style: theme.textTheme.headlineSmall),
              TextButton(onPressed: () => _goToTab(ref, 1), child: const Text('সব দেখুন')),
            ],
          ),
          timelineAsync.when(
            data: (entries) {
              final sorted = [...entries]..sort((a, b) => a.year.compareTo(b.year));
              return TimelineHighlightStrip(entries: sorted.take(6).toList(), onTapEntry: () => _goToTab(ref, 1));
            },
            loading: () => const SizedBox(height: 92, child: Center(child: CircularProgressIndicator())),
            error: (e, s) => Text('লোড ব্যর্থ: $e', style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}

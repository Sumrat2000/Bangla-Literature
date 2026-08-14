import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/timeline/presentation/screens/timeline_screen.dart';
import '../../features/study/presentation/screens/study_screen.dart';
import '../../features/practice/presentation/screens/practice_screen.dart';
import '../../features/progress/presentation/screens/progress_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';

/// Top-level shell: bottom navigation with 5 destinations (spec section 3)
/// plus a persistent global search action in the app bar. The selected tab
/// lives in Riverpod (selectedTabIndexProvider) rather than local State, so
/// other screens — like Home's icon-grid menu — can switch tabs directly.
class MainNavigation extends ConsumerWidget {
  const MainNavigation({super.key});

  static const _screens = [
    HomeScreen(),
    TimelineScreen(),
    StudyScreen(),
    PracticeScreen(),
    ProgressScreen(),
  ];

  static const _titles = ['হোম', 'টাইমলাইন', 'পড়াশোনা', 'প্র্যাকটিস', 'অগ্রগতি'];

  void _openSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedTabIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[index]),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'অনুসন্ধান করুন',
            onPressed: () => _openSearch(context),
          ),
        ],
      ),
      body: IndexedStack(index: index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => ref.read(selectedTabIndexProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'হোম'),
          NavigationDestination(
              icon: Icon(Icons.timeline_outlined), selectedIcon: Icon(Icons.timeline), label: 'টাইমলাইন'),
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'পড়াশোনা'),
          NavigationDestination(
              icon: Icon(Icons.quiz_outlined), selectedIcon: Icon(Icons.quiz), label: 'প্র্যাকটিস'),
          NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'অগ্রগতি'),
        ],
      ),
    );
  }
}

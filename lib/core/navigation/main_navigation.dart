import 'package:flutter/material.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/timeline/presentation/screens/timeline_screen.dart';
import '../../features/study/presentation/screens/study_screen.dart';
import '../../features/practice/presentation/screens/practice_screen.dart';
import '../../features/progress/presentation/screens/progress_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';

/// Top-level shell: bottom navigation with 5 destinations (spec section 3)
/// plus a persistent global search action in the app bar.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;

  static const _screens = [
    HomeScreen(),
    TimelineScreen(),
    StudyScreen(),
    PracticeScreen(),
    ProgressScreen(),
  ];

  static const _titles = ['হোম', 'টাইমলাইন', 'পড়াশোনা', 'অনুশীলন', 'অগ্রগতি'];

  void _openSearch() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'অনুসন্ধান করুন',
            onPressed: _openSearch,
          ),
        ],
      ),
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'হোম'),
          NavigationDestination(
              icon: Icon(Icons.timeline_outlined), selectedIcon: Icon(Icons.timeline), label: 'টাইমলাইন'),
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'পড়াশোনা'),
          NavigationDestination(
              icon: Icon(Icons.quiz_outlined), selectedIcon: Icon(Icons.quiz), label: 'অনুশীলন'),
          NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'অগ্রগতি'),
        ],
      ),
    );
  }
}

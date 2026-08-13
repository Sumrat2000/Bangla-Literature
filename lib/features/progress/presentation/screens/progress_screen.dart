import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/empty_state.dart';
import '../../../home/presentation/widgets/home_section_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        HomeSectionCard(
          title: 'অধ্যয়ন সারাংশ',
          icon: Icons.insights_outlined,
          child: EmptyState(message: 'এখনো কোনো অধ্যয়ন ডেটা নেই'),
        ),
        SizedBox(height: 12),
        HomeSectionCard(
          title: 'দুর্বলতা বিশ্লেষণ (Weak Topics)',
          icon: Icons.trending_down,
          child: EmptyState(message: 'অনুশীলন শুরু হলে দুর্বল topic এখানে দেখাবে'),
        ),
        SizedBox(height: 12),
        HomeSectionCard(
          title: 'Study Streak',
          icon: Icons.local_fire_department_outlined,
          child: EmptyState(message: 'স্ট্রিক শুরু হয়নি'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers.dart';
import 'mcq_practice_screen.dart';

/// Hub for all practice modes: Flashcard, Memory Mode, MCQ, Exam Mode,
/// and Confusing Facts (spec sections 9, 10, 13, 14, 12). MCQ practice is
/// wired to the real database; the others remain scaffolded until their
/// underlying content (flashcards, exam engine) is built in a later phase.
class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mcqCountAsync = ref.watch(mcqListProvider);

    final modes = [
      (Icons.psychology_outlined, 'মুখস্থ করুন (Memory Mode)', 'নিজে মনে করার চেষ্টা করুন, তারপর উত্তর দেখুন', false),
      (Icons.style_outlined, 'Flashcard', 'Easy / Hard / Forgot দিয়ে পুনরাবৃত্তি নিয়ন্ত্রণ করুন', false),
      (
        Icons.quiz_outlined,
        'MCQ অনুশীলন',
        mcqCountAsync.maybeWhen(data: (l) => '${l.length}টি প্রশ্ন প্রস্তুত', orElse: () => 'লোড হচ্ছে...'),
        true,
      ),
      (Icons.timer_outlined, 'Exam Mode', 'সময়সীমাসহ পূর্ণাঙ্গ পরীক্ষা', false),
      (Icons.compare_arrows, 'গুলিয়ে ফেলবেন না', 'কাছাকাছি তথ্য পাশাপাশি তুলনা করুন', false),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: modes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        final (icon, title, subtitle, isReady) = modes[i];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
              child: Icon(icon, color: theme.colorScheme.primary),
            ),
            title: Text(title, style: theme.textTheme.headlineSmall),
            subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              if (isReady) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const McqPracticeScreen()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title — শিগগিরই যুক্ত হবে')),
                );
              }
            },
          ),
        );
      },
    );
  }
}

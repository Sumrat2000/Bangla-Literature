import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/mcq.dart';
import '../../../../data/providers.dart';
import '../../../study/presentation/widgets/source_badge.dart';

/// Standard MCQ practice flow: show question → pick an option → reveal
/// correct answer + explanation → next question (spec section 13).
class McqPracticeScreen extends ConsumerStatefulWidget {
  const McqPracticeScreen({super.key});

  @override
  ConsumerState<McqPracticeScreen> createState() => _McqPracticeScreenState();
}

class _McqPracticeScreenState extends ConsumerState<McqPracticeScreen> {
  int _index = 0;
  String? _selectedOptionId;
  bool _revealed = false;
  int _correctCount = 0;
  int _answeredCount = 0;

  void _select(String optionId) {
    if (_revealed) return;
    setState(() => _selectedOptionId = optionId);
  }

  void _submit(Mcq q) {
    if (_selectedOptionId == null || _revealed) return;
    setState(() {
      _revealed = true;
      _answeredCount++;
      if (_selectedOptionId == q.correctOptionId) _correctCount++;
    });
  }

  void _next(int total) {
    setState(() {
      _index = (_index + 1) % total;
      _selectedOptionId = null;
      _revealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mcqsAsync = ref.watch(mcqListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MCQ অনুশীলন'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text('$_correctCount/$_answeredCount সঠিক', style: theme.textTheme.bodySmall)),
          ),
        ],
      ),
      body: mcqsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('প্রশ্ন লোড করা যায়নি: $err')),
        data: (mcqs) {
          if (mcqs.isEmpty) {
            return const Center(child: Text('এখনো কোনো MCQ যোগ করা হয়নি।'));
          }
          final q = mcqs[_index % mcqs.length];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: (_index + 1) / mcqs.length),
                const SizedBox(height: 6),
                Text('প্রশ্ন ${_index + 1} / ${mcqs.length} · ${q.topicLabel}', style: theme.textTheme.bodySmall),
                const SizedBox(height: 12),
                Text(q.question, style: theme.textTheme.headlineSmall),
                const SizedBox(height: 16),
                for (final opt in q.options) _OptionTile(
                  option: opt,
                  isSelected: _selectedOptionId == opt.id,
                  isCorrect: opt.id == q.correctOptionId,
                  revealed: _revealed,
                  onTap: () => _select(opt.id),
                ),
                const SizedBox(height: 12),
                if (_revealed) ...[
                  Card(
                    color: theme.colorScheme.primary.withOpacity(0.06),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ব্যাখ্যা', style: theme.textTheme.headlineSmall),
                          const SizedBox(height: 6),
                          Text(q.explanation, style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SourceBadge(sourceType: q.source.type.name),
                ],
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: _revealed ? () => _next(mcqs.length) : (_selectedOptionId == null ? null : () => _submit(q)),
                        child: Text(_revealed ? 'পরবর্তী প্রশ্ন' : 'উত্তর জমা দিন'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final McqOption option;
  final bool isSelected;
  final bool isCorrect;
  final bool revealed;
  final VoidCallback onTap;

  const _OptionTile({
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.revealed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color? bg;
    Color? border;
    if (revealed) {
      if (isCorrect) {
        bg = theme.colorScheme.primary.withOpacity(0.12);
        border = theme.colorScheme.primary;
      } else if (isSelected) {
        bg = Colors.red.withOpacity(0.10);
        border = Colors.red;
      }
    } else if (isSelected) {
      bg = theme.colorScheme.primary.withOpacity(0.08);
      border = theme.colorScheme.primary;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg ?? theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: border ?? theme.dividerColor),
          ),
          child: Row(
            children: [
              Expanded(child: Text(option.text, style: theme.textTheme.bodyLarge)),
              if (revealed && isCorrect) const Icon(Icons.check_circle, color: Colors.green, size: 20),
              if (revealed && isSelected && !isCorrect) const Icon(Icons.cancel, color: Colors.red, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

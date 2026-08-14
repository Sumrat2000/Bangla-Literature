import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/mcq.dart';
import '../../../../data/providers.dart';
import '../../../study/presentation/widgets/source_badge.dart';
import 'mcq_results_screen.dart';

/// Standard MCQ practice flow: show question → pick an option → reveal
/// correct answer + explanation → next question, finishing in a real
/// results screen (spec section 13). Every answer is persisted to
/// TopicProgress so "আমার অগ্রগতি" reflects real practice, not a mock.
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
  final Stopwatch _stopwatch = Stopwatch()..start();
  Timer? _tick;

  @override
  void initState() {
    super.initState();
    // Repaints once a second so the header timer visibly counts up.
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  void _select(String optionId) {
    if (_revealed) return;
    setState(() => _selectedOptionId = optionId);
  }

  void _submit(Mcq q) {
    if (_selectedOptionId == null || _revealed) return;
    final correct = _selectedOptionId == q.correctOptionId;
    setState(() {
      _revealed = true;
      _answeredCount++;
      if (correct) _correctCount++;
    });
    ref.read(progressRepositoryProvider).recordMcqAnswer(contentItemId: q.contentItemId, correct: correct);
  }

  void _next(int total) {
    if (_index + 1 >= total) {
      _stopwatch.stop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => McqResultsScreen(
            total: _answeredCount,
            correct: _correctCount,
            elapsed: _stopwatch.elapsed,
            onRetry: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const McqPracticeScreen()),
            ),
          ),
        ),
      );
      return;
    }
    setState(() {
      _index++;
      _selectedOptionId = null;
      _revealed = false;
    });
  }

  String _formatElapsed() {
    final s = _stopwatch.elapsed;
    final m = s.inMinutes.toString().padLeft(2, '0');
    final sec = (s.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$sec';
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
            child: Center(
              child: Row(
                children: [
                  const Icon(Icons.timer_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text(_formatElapsed(), style: theme.textTheme.bodySmall),
                ],
              ),
            ),
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
          final total = mcqs.length;
          final q = mcqs[_index];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: (_index + 1) / total),
                const SizedBox(height: 6),
                Text('প্রশ্ন ${_index + 1} / $total  ·  স্কোর: $_correctCount/$_answeredCount  ·  ${q.topicLabel}',
                    style: theme.textTheme.bodySmall),
                const SizedBox(height: 12),
                Text(q.question, style: theme.textTheme.headlineSmall),
                const SizedBox(height: 16),
                for (final opt in q.options)
                  _OptionTile(
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
                        onPressed: _revealed
                            ? () => _next(total)
                            : (_selectedOptionId == null ? null : () => _submit(q)),
                        child: Text(_revealed
                            ? (_index + 1 >= total ? 'ফলাফল দেখুন' : 'পরবর্তী প্রশ্ন')
                            : 'উত্তর জমা দিন'),
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

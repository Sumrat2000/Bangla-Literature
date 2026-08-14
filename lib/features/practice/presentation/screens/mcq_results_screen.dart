import 'package:flutter/material.dart';

class McqResultsScreen extends StatelessWidget {
  final int total;
  final int correct;
  final Duration elapsed;
  final VoidCallback onRetry;

  const McqResultsScreen({
    super.key,
    required this.total,
    required this.correct,
    required this.elapsed,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wrong = total - correct;
    final pct = total == 0 ? 0.0 : correct / total;
    final minutes = elapsed.inMinutes.toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text('ফলাফল')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pct >= 0.8 ? 'চমৎকার!' : (pct >= 0.5 ? 'ভালো হয়েছে' : 'আরও অনুশীলন দরকার'),
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: CircularProgressIndicator(
                      value: pct,
                      strokeWidth: 10,
                      backgroundColor: theme.dividerColor,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('$correct/$total', style: theme.textTheme.headlineLarge),
                      Text('${(pct * 100).round()}%', style: theme.textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatColumn(label: 'সঠিক উত্তর', value: '$correct', color: Colors.green),
                _StatColumn(label: 'ভুল উত্তর', value: '$wrong', color: Colors.red),
                _StatColumn(label: 'সময় নিয়েছে', value: '$minutes:$seconds', color: theme.colorScheme.primary),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: onRetry, child: const Text('আবার প্র্যাকটিস করুন')),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('হোমে ফিরে যান'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatColumn({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(value, style: theme.textTheme.headlineSmall?.copyWith(color: color)),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

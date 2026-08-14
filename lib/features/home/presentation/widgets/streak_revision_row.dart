import 'package:flutter/material.dart';

class StreakRevisionRow extends StatelessWidget {
  const StreakRevisionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: _InfoCard(
            icon: Icons.local_fire_department_outlined,
            iconColor: Colors.deepOrange,
            title: 'ধারাবাহিক অধ্যয়ন',
            body: Text('এখনো ট্র্যাক করা শুরু হয়নি', style: theme.textTheme.bodySmall),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _InfoCard(
            icon: Icons.schedule_outlined,
            iconColor: theme.colorScheme.primary,
            title: 'রিভিশন ডিউ',
            body: Text('Spaced repetition এখনো চালু হয়নি', style: theme.textTheme.bodySmall),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget body;

  const _InfoCard({required this.icon, required this.iconColor, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: iconColor),
                const SizedBox(width: 6),
                Expanded(child: Text(title, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700))),
              ],
            ),
            const SizedBox(height: 10),
            body,
          ],
        ),
      ),
    );
  }
}

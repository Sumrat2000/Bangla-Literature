import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class MenuGridTile {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuGridTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class MenuGrid extends StatelessWidget {
  final List<MenuGridTile> tiles;

  const MenuGrid({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tiles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, i) {
        final t = tiles[i];
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: t.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: t.color,
                child: Icon(t.icon, color: Colors.white, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                t.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                t.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.caption(theme.colorScheme.outline),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}

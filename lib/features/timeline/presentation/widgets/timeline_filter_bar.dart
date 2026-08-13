import 'package:flutter/material.dart';

import '../../../../data/models/content_item.dart';
import '../../../../data/models/timeline_entry.dart';

class TimelineFilterBar extends StatelessWidget {
  final ContentType? selectedType;
  final LiteraryEra? selectedEra;
  final ValueChanged<ContentType?> onTypeChanged;
  final ValueChanged<LiteraryEra?> onEraChanged;

  const TimelineFilterBar({
    super.key,
    required this.selectedType,
    required this.selectedEra,
    required this.onTypeChanged,
    required this.onEraChanged,
  });

  static const _typeLabels = {
    null: 'সব',
    ContentType.person: 'ব্যক্তি',
    ContentType.book: 'গ্রন্থ',
    ContentType.event: 'ঘটনা',
    ContentType.institution: 'প্রতিষ্ঠান',
    ContentType.magazine: 'পত্রিকা',
    ContentType.award: 'পুরস্কার',
    ContentType.literaryMovement: 'সাহিত্য আন্দোলন',
  };

  static const _eraLabels = {
    null: 'সব যুগ',
    LiteraryEra.ancient: 'প্রাচীন',
    LiteraryEra.medieval: 'মধ্যযুগ',
    LiteraryEra.modern: 'আধুনিক',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _chipRow<ContentType?>(
          context,
          values: _typeLabels.keys.toList(),
          labels: _typeLabels,
          selected: selectedType,
          onChanged: onTypeChanged,
        ),
        const SizedBox(height: 4),
        _chipRow<LiteraryEra?>(
          context,
          values: _eraLabels.keys.toList(),
          labels: _eraLabels,
          selected: selectedEra,
          onChanged: onEraChanged,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _chipRow<T>(
    BuildContext context, {
    required List<T> values,
    required Map<T, String> labels,
    required T selected,
    required ValueChanged<T> onChanged,
  }) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        itemCount: values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final value = values[i];
          final isSelected = value == selected;
          return ChoiceChip(
            label: Text(labels[value] ?? ''),
            selected: isSelected,
            onSelected: (_) => onChanged(value),
          );
        },
      ),
    );
  }
}

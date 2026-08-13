import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/content_item.dart';
import '../../../../data/models/timeline_entry.dart';
import '../../../../data/providers.dart';
import '../widgets/timeline_filter_bar.dart';
import '../widgets/timeline_card.dart';

/// Vertical, filterable, expandable timeline (spec section 6-7), backed by
/// the real content database — populated at startup from
/// assets/content/content_pack_01.json.
class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  ContentType? _typeFilter;
  LiteraryEra? _eraFilter;
  String? _expandedId;

  List<TimelineEntry> _filter(List<TimelineEntry> entries) {
    return entries.where((e) {
      final typeOk = _typeFilter == null || e.relatedType == _typeFilter;
      final eraOk = _eraFilter == null || e.era == _eraFilter;
      return typeOk && eraOk;
    }).toList()
      ..sort((a, b) => a.year.compareTo(b.year));
  }

  @override
  Widget build(BuildContext context) {
    final entriesAsync = ref.watch(timelineEntriesProvider);

    return Column(
      children: [
        TimelineFilterBar(
          selectedType: _typeFilter,
          selectedEra: _eraFilter,
          onTypeChanged: (t) => setState(() => _typeFilter = t),
          onEraChanged: (e) => setState(() => _eraFilter = e),
        ),
        const Divider(height: 1),
        Expanded(
          child: entriesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Center(child: Text('টাইমলাইন লোড করা যায়নি: $err')),
            data: (allEntries) {
              final entries = _filter(allEntries);
              if (entries.isEmpty) {
                return const Center(child: Text('এই ফিল্টারে কোনো তথ্য নেই'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  final isExpanded = _expandedId == entry.id;
                  return TimelineCard(
                    entry: entry,
                    isExpanded: isExpanded,
                    isLast: index == entries.length - 1,
                    onTap: () => setState(() => _expandedId = isExpanded ? null : entry.id),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

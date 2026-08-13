import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../models/content_item.dart';
import '../models/source_info.dart';
import '../models/timeline_entry.dart';

class TimelineRepository {
  final AppDatabase db;
  TimelineRepository(this.db);

  Future<List<TimelineEntry>> getAll() async {
    final rows = await (db.select(db.timelineEntriesTable)
          ..orderBy([(t) => OrderingTerm(expression: t.year)]))
        .get();
    return rows.map(_toModel).toList();
  }

  TimelineEntry _toModel(TimelineEntryRow row) {
    return TimelineEntry(
      id: row.id,
      year: row.year,
      title: row.title,
      shortInfo: row.shortInfo,
      detailedInfo: row.detailedInfo,
      relatedType: _parseEnum(ContentType.values, row.relatedType, ContentType.topic),
      contentItemId: row.contentItemId,
      era: _parseEnum(LiteraryEra.values, row.era, LiteraryEra.unknown),
      examImportant: row.examImportant,
      source: SourceInfo(
        type: _parseEnum(SourceType.values, row.sourceType, SourceType.needsVerification),
        sourceDocument: row.sourceDocument,
        examImportant: row.examImportant,
      ),
    );
  }

  T _parseEnum<T extends Enum>(List<T> values, String name, T fallback) {
    for (final v in values) {
      if (v.name == name) return v;
    }
    return fallback;
  }
}

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../database/app_database.dart';
import '../database/tables/content_tables.dart';

/// Reads a JSON content pack (see assets/content/content_pack_01.json) and
/// upserts every row into the Drift database. This is the runtime version
/// of the "PDF Processing Workflow" (spec section 21) — the LLM-side
/// analysis of a new PDF produces a content pack JSON file with this exact
/// shape, and this service is what turns it into queryable app data.
///
/// Calling this again with a newer pack (same ids) UPDATES existing rows
/// rather than duplicating them — safe to re-run, and safe to run once per
/// pack at first launch after a new PDF is integrated.
class ContentImportService {
  final AppDatabase db;
  ContentImportService(this.db);

  Future<ContentImportResult> importAssetPack(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    final Map<String, dynamic> json = jsonDecode(raw) as Map<String, dynamic>;
    return importPack(json);
  }

  Future<ContentImportResult> importPack(Map<String, dynamic> pack) async {
    final items = (pack['contentItems'] as List<dynamic>? ?? []);
    final timeline = (pack['timelineEntries'] as List<dynamic>? ?? []);
    final mcqs = (pack['mcqs'] as List<dynamic>? ?? []);

    var itemCount = 0, factCount = 0, sectionCount = 0, timelineCount = 0, mcqCount = 0;

    await db.transaction(() async {
      for (final raw in items) {
        final item = raw as Map<String, dynamic>;
        final source = (item['source'] as Map<String, dynamic>? ?? const {});

        await db.into(db.contentItems).insertOnConflictUpdate(ContentItemsCompanion.insert(
              id: item['id'] as String,
              type: item['type'] as String,
              title: item['title'] as String,
              shortDescription: item['shortDescription'] as String,
              tagsJson: Value(jsonEncode(item['tags'] ?? const [])),
              relatedPersonIdsJson: Value(jsonEncode(item['relatedPersonIds'] ?? const [])),
              relatedBookIdsJson: Value(jsonEncode(item['relatedBookIds'] ?? const [])),
              relatedTopicIdsJson: Value(jsonEncode(item['relatedTopicIds'] ?? const [])),
              sourceType: (source['sourceType'] as String?) ?? 'needsVerification',
              sourceDocument: Value(source['sourceDocument'] as String?),
              sourceLocation: Value(source['sourceLocation'] as String?),
              examImportant: Value(source['examImportant'] as bool? ?? false),
            ));
        itemCount++;

        // Sections: delete-then-insert for this item so re-imports don't duplicate.
        await (db.delete(db.contentSections)
              ..where((t) => t.contentItemId.equals(item['id'] as String)))
            .go();
        final sections = (item['detailedSections'] as List<dynamic>? ?? []);
        for (var i = 0; i < sections.length; i++) {
          final s = sections[i] as Map<String, dynamic>;
          await db.into(db.contentSections).insert(ContentSectionsCompanion.insert(
                contentItemId: item['id'] as String,
                orderIndex: i,
                heading: s['heading'] as String,
                body: s['body'] as String,
              ));
          sectionCount++;
        }

        final facts = (item['facts'] as List<dynamic>? ?? []);
        for (final rawFact in facts) {
          final fact = rawFact as Map<String, dynamic>;
          final fsource = (fact['source'] as Map<String, dynamic>? ?? const {});
          await db.into(db.contentFacts).insertOnConflictUpdate(ContentFactsCompanion.insert(
                id: fact['id'] as String,
                contentItemId: item['id'] as String,
                label: fact['label'] as String,
                value: fact['value'] as String,
                year: Value(fact['year'] as int?),
                sourceType: (fsource['sourceType'] as String?) ?? 'needsVerification',
                sourceDocument: Value(fsource['sourceDocument'] as String?),
                sourceLocation: Value(fsource['sourceLocation'] as String?),
                examImportant: Value(fsource['examImportant'] as bool? ?? false),
              ));
          factCount++;
        }
      }

      for (final raw in timeline) {
        final t = raw as Map<String, dynamic>;
        final source = (t['source'] as Map<String, dynamic>? ?? const {});
        await db.into(db.timelineEntriesTable).insertOnConflictUpdate(TimelineEntriesTableCompanion.insert(
              id: t['id'] as String,
              year: t['year'] as int,
              title: t['title'] as String,
              shortInfo: t['shortInfo'] as String,
              detailedInfo: t['detailedInfo'] as String,
              relatedType: t['relatedType'] as String,
              contentItemId: t['contentItemId'] as String,
              relatedPersonIdsJson: Value(jsonEncode(t['relatedPersonIds'] ?? const [])),
              relatedBookIdsJson: Value(jsonEncode(t['relatedBookIds'] ?? const [])),
              era: Value(t['era'] as String? ?? 'unknown'),
              examImportant: Value(t['examImportant'] as bool? ?? false),
              sourceType: (source['sourceType'] as String?) ?? 'needsVerification',
              sourceDocument: Value(source['sourceDocument'] as String?),
            ));
        timelineCount++;
      }

      for (final raw in mcqs) {
        final m = raw as Map<String, dynamic>;
        final source = (m['source'] as Map<String, dynamic>? ?? const {});
        await db.into(db.mcqs).insertOnConflictUpdate(McqsCompanion.insert(
              id: m['id'] as String,
              type: m['type'] as String,
              difficulty: m['difficulty'] as String,
              question: m['question'] as String,
              optionsJson: jsonEncode(m['options']),
              correctOptionId: m['correctOptionId'] as String,
              explanation: m['explanation'] as String,
              contentItemId: m['contentItemId'] as String,
              topicLabel: m['topicLabel'] as String,
              sourceType: (source['sourceType'] as String?) ?? 'needsVerification',
              sourceDocument: Value(source['sourceDocument'] as String?),
            ));
        mcqCount++;
      }
    });

    return ContentImportResult(
      contentItems: itemCount,
      facts: factCount,
      sections: sectionCount,
      timelineEntries: timelineCount,
      mcqs: mcqCount,
    );
  }
}

class ContentImportResult {
  final int contentItems;
  final int facts;
  final int sections;
  final int timelineEntries;
  final int mcqs;

  const ContentImportResult({
    required this.contentItems,
    required this.facts,
    required this.sections,
    required this.timelineEntries,
    required this.mcqs,
  });

  @override
  String toString() =>
      'Imported: $contentItems items, $facts facts, $sections sections, $timelineEntries timeline entries, $mcqs MCQs';
}

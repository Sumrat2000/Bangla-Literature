import 'package:drift/drift.dart';

import '../database/app_database.dart';

class ContentRepository {
  final AppDatabase db;
  ContentRepository(this.db);

  /// All content items, alphabetically — feeds the Study (reading) list.
  Future<List<ContentItemRow>> getAll() async {
    return (db.select(db.contentItems)..orderBy([(t) => OrderingTerm(expression: t.title)])).get();
  }

  Future<ContentItemRow?> getById(String id) async {
    return (db.select(db.contentItems)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<ContentSectionRow>> getSections(String contentItemId) async {
    return (db.select(db.contentSections)
          ..where((t) => t.contentItemId.equals(contentItemId))
          ..orderBy([(t) => OrderingTerm(expression: t.orderIndex)]))
        .get();
  }

  Future<List<ContentFactRow>> getFacts(String contentItemId) async {
    return (db.select(db.contentFacts)..where((t) => t.contentItemId.equals(contentItemId))).get();
  }

  /// Case-insensitive title/description search for the global Search screen.
  Future<List<ContentItemRow>> search(String query) async {
    if (query.trim().isEmpty) return [];
    final like = '%${query.trim()}%';
    return (db.select(db.contentItems)
          ..where((t) => t.title.like(like) | t.shortDescription.like(like)))
        .get();
  }

  Future<int> countAll() async => (await db.select(db.contentItems).get()).length;

  /// Facts flagged exam-important (⭐) across every topic — feeds the
  /// "গুরুত্বপূর্ণ তথ্য" screen from Home's icon grid.
  Future<List<ExamImportantFact>> getExamImportantFacts() async {
    final facts = await (db.select(db.contentFacts)..where((t) => t.examImportant.equals(true))).get();
    if (facts.isEmpty) return [];
    final itemIds = facts.map((f) => f.contentItemId).toSet();
    final items = await (db.select(db.contentItems)..where((t) => t.id.isIn(itemIds))).get();
    final titleById = {for (final i in items) i.id: i.title};
    return facts
        .map((f) => ExamImportantFact(
              itemTitle: titleById[f.contentItemId] ?? '',
              label: f.label,
              value: f.value,
            ))
        .toList();
  }
}

class ExamImportantFact {
  final String itemTitle;
  final String label;
  final String value;
  const ExamImportantFact({required this.itemTitle, required this.label, required this.value});
}

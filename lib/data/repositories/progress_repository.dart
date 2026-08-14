import 'package:drift/drift.dart';

import '../database/app_database.dart';

class ProgressRepository {
  final AppDatabase db;
  ProgressRepository(this.db);

  Future<void> markTopicRead(String contentItemId) async {
    final existing = await (db.select(db.topicProgress)..where((t) => t.contentItemId.equals(contentItemId)))
        .getSingleOrNull();
    if (existing == null) {
      await db.into(db.topicProgress).insert(TopicProgressCompanion.insert(
            contentItemId: contentItemId,
            isRead: const Value(true),
          ));
    } else if (!existing.isRead) {
      await (db.update(db.topicProgress)..where((t) => t.contentItemId.equals(contentItemId)))
          .write(const TopicProgressCompanion(isRead: Value(true)));
    }
  }

  Future<void> recordMcqAnswer({required String contentItemId, required bool correct}) async {
    final existing = await (db.select(db.topicProgress)..where((t) => t.contentItemId.equals(contentItemId)))
        .getSingleOrNull();
    final now = DateTime.now();
    if (existing == null) {
      await db.into(db.topicProgress).insert(TopicProgressCompanion.insert(
            contentItemId: contentItemId,
            correctCount: Value(correct ? 1 : 0),
            wrongCount: Value(correct ? 0 : 1),
            lastPracticedAt: Value(now),
          ));
    } else {
      await (db.update(db.topicProgress)..where((t) => t.contentItemId.equals(contentItemId))).write(
        TopicProgressCompanion(
          correctCount: Value(existing.correctCount + (correct ? 1 : 0)),
          wrongCount: Value(existing.wrongCount + (correct ? 0 : 1)),
          lastPracticedAt: Value(now),
        ),
      );
    }
  }

  Future<Set<String>> getReadTopicIds() async {
    final rows = await (db.select(db.topicProgress)..where((t) => t.isRead.equals(true))).get();
    return rows.map((r) => r.contentItemId).toSet();
  }

  Future<List<TopicProgressRow>> getAllProgress() async {
    return db.select(db.topicProgress).get();
  }
}

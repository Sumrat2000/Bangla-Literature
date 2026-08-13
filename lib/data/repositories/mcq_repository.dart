import 'dart:convert';

import '../database/app_database.dart';
import '../models/mcq.dart';
import '../models/source_info.dart';

class McqRepository {
  final AppDatabase db;
  McqRepository(this.db);

  Future<List<Mcq>> getAll() async {
    final rows = await db.select(db.mcqs).get();
    return rows.map(_toModel).toList();
  }

  Future<int> count() async => (await db.select(db.mcqs).get()).length;

  Mcq _toModel(McqRow row) {
    final optionsRaw = jsonDecode(row.optionsJson) as List<dynamic>;
    return Mcq(
      id: row.id,
      type: _parseEnum(McqType.values, row.type, McqType.standard),
      difficulty: _parseEnum(McqDifficulty.values, row.difficulty, McqDifficulty.medium),
      question: row.question,
      options: optionsRaw
          .map((o) => McqOption(id: o['id'] as String, text: o['text'] as String))
          .toList(),
      correctOptionId: row.correctOptionId,
      explanation: row.explanation,
      contentItemId: row.contentItemId,
      factId: row.factId,
      topicLabel: row.topicLabel,
      source: SourceInfo(
        type: _parseEnum(SourceType.values, row.sourceType, SourceType.needsVerification),
        sourceDocument: row.sourceDocument,
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

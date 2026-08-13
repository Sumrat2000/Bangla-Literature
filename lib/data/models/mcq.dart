import 'source_info.dart';

enum McqType {
  standard,
  reverse, // e.g. "১৮৬১ সালে জন্মগ্রহণ করেন কে?"
  statementBased,
  fillInTheBlank,
  trueFalse,
  matching,
  factBased,
}

enum McqDifficulty { easy, medium, hard }

class McqOption {
  final String id;
  final String text;

  const McqOption({required this.id, required this.text});
}

/// MCQs are generated from ContentFact pairs (see MCQRepository) so a
/// single fact can produce a standard question and its reverse without
/// the content being written twice anywhere.
class Mcq {
  final String id;
  final McqType type;
  final McqDifficulty difficulty;
  final String question;
  final List<McqOption> options;
  final String correctOptionId;
  final String explanation;
  final String contentItemId;
  final String? factId;
  final String topicLabel;
  final SourceInfo source;

  const Mcq({
    required this.id,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.options,
    required this.correctOptionId,
    required this.explanation,
    required this.contentItemId,
    this.factId,
    required this.topicLabel,
    required this.source,
  });
}

import 'source_info.dart';

enum ReviewFeedback { easy, hard, forgot }

/// A flashcard is generated from a ContentFact (front = generated
/// question from label, back = value) — see FlashcardRepository.
/// The scheduling fields below implement the Day 0/1/3/7/14/30 spaced
/// repetition described in spec section 11.
class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String contentItemId;
  final String? factId;
  final String topicLabel; // shown as the "source/topic" tag under the card

  // Spaced repetition state (mutable, persisted per-user in the DB layer)
  final DateTime? lastReviewedAt;
  final DateTime? nextDueAt;
  final int intervalStageIndex; // index into [0,1,3,7,14,30] days
  final int forgetCount;

  final SourceInfo source;

  const Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    required this.contentItemId,
    this.factId,
    required this.topicLabel,
    this.lastReviewedAt,
    this.nextDueAt,
    this.intervalStageIndex = 0,
    this.forgetCount = 0,
    required this.source,
  });

  static const List<int> intervalStagesDays = [0, 1, 3, 7, 14, 30];

  Flashcard withReview(ReviewFeedback feedback, DateTime now) {
    int nextStage;
    int newForgetCount = forgetCount;
    switch (feedback) {
      case ReviewFeedback.easy:
        nextStage = (intervalStageIndex + 1).clamp(0, intervalStagesDays.length - 1);
        break;
      case ReviewFeedback.hard:
        nextStage = intervalStageIndex; // repeat same stage sooner
        break;
      case ReviewFeedback.forgot:
        nextStage = 0; // reset to Day 0
        newForgetCount += 1;
        break;
    }
    final days = intervalStagesDays[nextStage];
    return Flashcard(
      id: id,
      question: question,
      answer: answer,
      contentItemId: contentItemId,
      factId: factId,
      topicLabel: topicLabel,
      lastReviewedAt: now,
      nextDueAt: now.add(Duration(days: days)),
      intervalStageIndex: nextStage,
      forgetCount: newForgetCount,
      source: source,
    );
  }
}

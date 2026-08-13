import 'source_info.dart';

/// The type of a content node in the central database. Every fact in the
/// app is one of these — nothing is hardcoded into a screen.
enum ContentType {
  person,
  book,
  event,
  institution,
  magazine,
  award,
  literaryMovement,
  topic, // general chapter/subject entry (e.g. "প্রাচীন যুগ")
}

/// A single (label, value) fact used to build Quick Facts, Flashcards,
/// and MCQs without duplicating text. e.g. label: "জন্ম", value: "১৮৬১"
class ContentFact {
  final String id;
  final String label;
  final String value;

  /// If this fact has an associated year, store it separately (as int)
  /// so the Timeline can index it directly instead of parsing strings.
  final int? year;

  final SourceInfo source;

  const ContentFact({
    required this.id,
    required this.label,
    required this.value,
    this.year,
    required this.source,
  });

  factory ContentFact.fromJson(Map<String, dynamic> json) => ContentFact(
        id: json['id'] as String,
        label: json['label'] as String,
        value: json['value'] as String,
        year: json['year'] as int?,
        source: SourceInfo.fromJson(json['source'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'value': value,
        'year': year,
        'source': source.toJson(),
      };
}

/// The central content node. This is what section 20 of the spec calls
/// the "central content model" — Timeline, Reading, Search, Flashcard,
/// MCQ, and Exam are all *views* generated from lists of these, never
/// separately hand-written content.
class ContentItem {
  final String id; // e.g. "person_rabindranath"
  final ContentType type;
  final String title;
  final String shortDescription;

  /// Longer reading-mode text, already split into readable sections by
  /// heading (spec section 5: "Long paragraph হলে ছোট sections-এ ভাগ করবে").
  final List<ContentSection> detailedSections;

  /// Structured facts — feeds Quick Facts, Flashcards, MCQs, Timeline.
  final List<ContentFact> facts;

  /// IDs of related ContentItems (person ↔ book ↔ event ...).
  final List<String> relatedPersonIds;
  final List<String> relatedBookIds;
  final List<String> relatedTopicIds;

  /// Free-form tags for search/filter (era, genre, etc.)
  final List<String> tags;

  final SourceInfo source;

  const ContentItem({
    required this.id,
    required this.type,
    required this.title,
    required this.shortDescription,
    this.detailedSections = const [],
    this.facts = const [],
    this.relatedPersonIds = const [],
    this.relatedBookIds = const [],
    this.relatedTopicIds = const [],
    this.tags = const [],
    required this.source,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) => ContentItem(
        id: json['id'] as String,
        type: ContentType.values.firstWhere((e) => e.name == json['type']),
        title: json['title'] as String,
        shortDescription: json['shortDescription'] as String,
        detailedSections: (json['detailedSections'] as List<dynamic>? ?? [])
            .map((e) => ContentSection.fromJson(e as Map<String, dynamic>))
            .toList(),
        facts: (json['facts'] as List<dynamic>? ?? [])
            .map((e) => ContentFact.fromJson(e as Map<String, dynamic>))
            .toList(),
        relatedPersonIds: List<String>.from(json['relatedPersonIds'] ?? const []),
        relatedBookIds: List<String>.from(json['relatedBookIds'] ?? const []),
        relatedTopicIds: List<String>.from(json['relatedTopicIds'] ?? const []),
        tags: List<String>.from(json['tags'] ?? const []),
        source: SourceInfo.fromJson(json['source'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'title': title,
        'shortDescription': shortDescription,
        'detailedSections': detailedSections.map((e) => e.toJson()).toList(),
        'facts': facts.map((e) => e.toJson()).toList(),
        'relatedPersonIds': relatedPersonIds,
        'relatedBookIds': relatedBookIds,
        'relatedTopicIds': relatedTopicIds,
        'tags': tags,
        'source': source.toJson(),
      };
}

/// One readable chunk of the "Detailed Explanation" (spec section 5 & 24:
/// never one giant paragraph — always short, headed sections).
class ContentSection {
  final String heading;
  final String body;

  const ContentSection({required this.heading, required this.body});

  factory ContentSection.fromJson(Map<String, dynamic> json) =>
      ContentSection(heading: json['heading'] as String, body: json['body'] as String);

  Map<String, dynamic> toJson() => {'heading': heading, 'body': body};
}

/// Where a piece of content came from. This is attached to every
/// ContentItem and to individual facts where relevant, so the UI can
/// render the correct badge (📘 PDF Source / 🤖 AI Supplementary /
/// 🔎 Verified / ⭐ Exam Important) and so nothing AI-generated can ever
/// silently overwrite PDF-sourced truth.
enum SourceType {
  pdf,
  aiSupplementary,
  verified,
  needsVerification,
}

class SourceInfo {
  final SourceType type;

  /// e.g. "Bangla Literature PDF 01" — required when type == pdf
  final String? sourceDocument;

  /// Optional page/section reference inside the source document.
  final String? sourceLocation;

  /// Whether this fact is flagged as important for exams (⭐).
  final bool examImportant;

  const SourceInfo({
    required this.type,
    this.sourceDocument,
    this.sourceLocation,
    this.examImportant = false,
  });

  factory SourceInfo.pdf(String document, {String? location, bool examImportant = false}) =>
      SourceInfo(
        type: SourceType.pdf,
        sourceDocument: document,
        sourceLocation: location,
        examImportant: examImportant,
      );

  factory SourceInfo.aiSupplementary({bool examImportant = false}) =>
      SourceInfo(type: SourceType.aiSupplementary, examImportant: examImportant);

  factory SourceInfo.fromJson(Map<String, dynamic> json) => SourceInfo(
        type: SourceType.values.firstWhere(
          (e) => e.name == json['sourceType'],
          orElse: () => SourceType.needsVerification,
        ),
        sourceDocument: json['sourceDocument'] as String?,
        sourceLocation: json['sourceLocation'] as String?,
        examImportant: json['examImportant'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'sourceType': type.name,
        'sourceDocument': sourceDocument,
        'sourceLocation': sourceLocation,
        'examImportant': examImportant,
      };
}

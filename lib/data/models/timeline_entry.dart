import 'content_item.dart';
import 'source_info.dart';

/// Broad era filter (spec section 7: Ancient / Medieval / Modern).
enum LiteraryEra { ancient, medieval, modern, unknown }

/// A single timeline card. In practice these are *derived* from
/// ContentItem + ContentFact (a fact with a year produces a timeline
/// entry) rather than authored twice — see TimelineRepository.
class TimelineEntry {
  final String id;
  final int year;
  final String title; // e.g. "রবীন্দ্রনাথ ঠাকুরের জন্ম"
  final String shortInfo;
  final String detailedInfo;
  final ContentType relatedType; // person / book / event / institution ...
  final String contentItemId; // links back to the ContentItem this came from
  final List<String> relatedPersonIds;
  final List<String> relatedBookIds;
  final LiteraryEra era;
  final bool examImportant;
  final SourceInfo source;

  const TimelineEntry({
    required this.id,
    required this.year,
    required this.title,
    required this.shortInfo,
    required this.detailedInfo,
    required this.relatedType,
    required this.contentItemId,
    this.relatedPersonIds = const [],
    this.relatedBookIds = const [],
    this.era = LiteraryEra.unknown,
    this.examImportant = false,
    required this.source,
  });
}

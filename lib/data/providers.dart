import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import 'database/app_database.dart';
import 'models/mcq.dart';
import 'models/timeline_entry.dart';
import 'repositories/content_import_service.dart';
import 'repositories/content_repository.dart';
import 'repositories/mcq_repository.dart';
import 'repositories/progress_repository.dart';
import 'repositories/timeline_repository.dart';

/// Single AppDatabase instance for the app's lifetime.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final contentImportServiceProvider = Provider<ContentImportService>((ref) {
  return ContentImportService(ref.watch(appDatabaseProvider));
});

final timelineRepositoryProvider = Provider<TimelineRepository>((ref) {
  return TimelineRepository(ref.watch(appDatabaseProvider));
});

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(ref.watch(appDatabaseProvider));
});

final mcqRepositoryProvider = Provider<McqRepository>((ref) {
  return McqRepository(ref.watch(appDatabaseProvider));
});

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return ProgressRepository(ref.watch(appDatabaseProvider));
});

/// Runs once at app startup (see main.dart): imports the bundled content
/// pack(s) into the database. Safe to depend on multiple places — Riverpod
/// caches the Future, so the import itself only runs once per app session.
final contentImportProvider = FutureProvider<ContentImportResult>((ref) async {
  final service = ref.watch(contentImportServiceProvider);
  // Add one line per content pack as new PDFs are integrated — each pack
  // upserts by id, so importing an already-imported pack again is harmless.
  return service.importAssetPack('assets/content/content_pack_01.json');
});

final timelineEntriesProvider = FutureProvider<List<TimelineEntry>>((ref) async {
  ref.watch(contentImportProvider); // ensure import has completed first
  return ref.watch(timelineRepositoryProvider).getAll();
});

final topicListProvider = FutureProvider((ref) async {
  ref.watch(contentImportProvider);
  return ref.watch(contentRepositoryProvider).getAll();
});

final mcqListProvider = FutureProvider<List<Mcq>>((ref) async {
  ref.watch(contentImportProvider);
  return ref.watch(mcqRepositoryProvider).getAll();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider((ref) async {
  final query = ref.watch(searchQueryProvider);
  return ref.watch(contentRepositoryProvider).search(query);
});

final examImportantFactsProvider = FutureProvider((ref) async {
  ref.watch(contentImportProvider);
  return ref.watch(contentRepositoryProvider).getExamImportantFacts();
});

/// Content items grouped into "chapters" by era tag — a real, derived view
/// over the same ContentItem rows (spec section 2: one fact → many views),
/// not a separately hand-authored chapter list.
const kEraOrder = ['প্রাচীন যুগ', 'অন্ধকার যুগ', 'মধ্যযুগ', 'আধুনিক যুগ'];

final chapterGroupsProvider = FutureProvider<List<ChapterGroup>>((ref) async {
  final topics = await ref.watch(topicListProvider.future);
  final readIds = await ref.watch(readTopicIdsProvider.future);

  final groups = <String, List<ContentItemRow>>{for (final era in kEraOrder) era: []};
  final other = <ContentItemRow>[];
  for (final t in topics) {
    final tags = _decodeTags(t.tagsJson);
    final era = kEraOrder.firstWhere((e) => tags.contains(e), orElse: () => '');
    if (era.isEmpty) {
      other.add(t);
    } else {
      groups[era]!.add(t);
    }
  }
  if (other.isNotEmpty) groups['অন্যান্য'] = other;

  return groups.entries
      .where((e) => e.value.isNotEmpty)
      .map((e) => ChapterGroup(
            era: e.key,
            items: e.value,
            readCount: e.value.where((t) => readIds.contains(t.id)).length,
          ))
      .toList();
});

final readTopicIdsProvider = FutureProvider<Set<String>>((ref) async {
  ref.watch(contentImportProvider);
  return ref.watch(progressRepositoryProvider).getReadTopicIds();
});

final topicProgressProvider = FutureProvider((ref) async {
  ref.watch(contentImportProvider);
  return ref.watch(progressRepositoryProvider).getAllProgress();
});

class ChapterGroup {
  final String era;
  final List<ContentItemRow> items;
  final int readCount;
  const ChapterGroup({required this.era, required this.items, required this.readCount});
}

List<String> _decodeTags(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is List) return decoded.map((e) => e.toString()).toList();
  } catch (_) {
    // Malformed/empty tags fall through to "অন্যান্য" rather than crashing.
  }
  return const [];
}

/// Drives MainNavigation's bottom-tab selection from anywhere (e.g. Home's
/// icon-grid menu tiles) without needing a BuildContext-based navigation
/// hack between sibling tabs.
final selectedTabIndexProvider = StateProvider<int>((ref) => 0);

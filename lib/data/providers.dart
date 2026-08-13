import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database/app_database.dart';
import 'models/mcq.dart';
import 'models/timeline_entry.dart';
import 'repositories/content_import_service.dart';
import 'repositories/content_repository.dart';
import 'repositories/mcq_repository.dart';
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

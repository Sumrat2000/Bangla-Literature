# বাংলা সাহিত্য — Interactive Learning & Revision Platform

Offline-first Flutter app that turns Bengali-literature PDFs into a single
structured content database, then generates Reading, Timeline, Quick
Facts, Flashcards, MCQs, Exams, and Revision from that *one* dataset —
no content is ever hand-written twice for different features.

## Status

Phase 1 (setup/theme/navigation) and Phase 2 (data model + Drift schema)
are done. The first PDF (`Regular_Class_Bengali_Literature-01.pdf`, a
BCS-prep lecture on Bengali literature's early/medieval periods) has been
analyzed and turned into `assets/content/content_pack_01.json` — 24 content
items (persons/books/topics), 10 timeline entries, and 20 real MCQs, all
labeled with 📘 PDF-source badges.

That pack is imported into the local Drift database automatically at app
startup (`ContentImportService`, wired in `main.dart`). Wired to real data
so far: **Timeline** (filterable, expandable, real years), **Study**
(topic list → structured reading detail with Quick Facts + sections),
**MCQ practice** (question → answer → explanation → next), **Search**
(title/description match), and **Home** highlights (topic/MCQ counts,
top timeline entries). Flashcards, Memory Mode, Exam Mode, Confusing
Facts, and spaced-repetition scheduling are modeled (`Flashcard`, `Mcq`
already support it) but not yet wired to a screen — that's the next phase.

Send the next PDF whenever ready; it'll be analyzed, reported on, and
added as `content_pack_02.json` without touching what's already built.

## Requirements

- Flutter SDK ≥ 3.22 (Dart ≥ 3.3)
- Android SDK / `sdkmanager` command-line tools
- For Termux: `pkg install flutter` (or manually installed Flutter SDK
  on `$PATH`), plus `pkg install android-tools` if you need `adb`.
  Building large Flutter/Android projects entirely inside Termux is
  possible but slow and memory-hungry — a swap file of 4GB+ is
  recommended on-device, or build on a laptop/CI and side-load the APK.

## Setup

```bash
git clone <your-repo-url>
cd bangla_sahitya_app
flutter pub get

# Generate Drift (database) code — required before first run:
dart run build_runner build --delete-conflicting-outputs
```

## Run (debug)

```bash
flutter run
```

## Build APK

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release
```

The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

## Whenever you add new database fields

Re-run codegen after editing anything in `lib/data/database/tables/`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Project rules (do not violate these when adding new PDFs)

1. **One database, not one app per PDF.** New PDFs add rows to the
   existing `ContentItems` / `ContentFacts` / etc. tables — they never
   spawn a parallel content system.
2. **Never overwrite PDF-sourced facts with AI-generated ones.** Every
   `ContentItem` and `ContentFact` carries a `SourceInfo`
   (`pdf` / `aiSupplementary` / `verified` / `needsVerification`). PDF
   data has priority; AI supplementary content is additive and always
   labeled (📘 / 🤖 / 🔎 / ⭐ in the UI).
3. **Don't invent facts.** If something is uncertain, mark it
   `needsVerification` instead of asserting it.
4. **One fact → many views.** Add a fact once to `ContentFacts`;
   Timeline, Flashcards, MCQs, and Quick Facts are all generated from
   it by repositories — do not hand-author the same fact in multiple
   places.
5. **Preserve existing functionality.** Adding a PDF's content should
   never require rewriting screens, only adding data + occasionally a
   new repository method.

## Folder structure

```
lib/
  core/
    theme/          # colors, text styles, light/dark ThemeData
    navigation/      # bottom-nav shell
  data/
    models/          # ContentItem, ContentFact, TimelineEntry, Flashcard, Mcq, SourceInfo
    database/        # Drift tables + AppDatabase
    repositories/    # (next) turns raw content rows into Timeline/Flashcard/MCQ views
  features/
    home/
    timeline/
    study/           # reading system
    practice/        # flashcards, memory mode, MCQ, exam, confusing facts
    progress/
    search/
```

## Next step

Send the first Bengali-literature PDF. It will be analyzed and reported
back (topics found, person/book/year/event counts, proposed new
sections, estimated MCQ count, any ambiguous parts) before any content
is integrated, per the agreed workflow.

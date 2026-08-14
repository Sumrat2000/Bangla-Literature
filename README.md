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
(title/description match), **Important Facts** (every ⭐ exam-important
fact, database-driven), and **Home** — redesigned with a hero highlight
banner, stat chips, an 8-tile icon menu, and a horizontal timeline strip,
matching a reference design the user provided. All numbers shown are
real or honestly labeled "not tracked yet" — none are placeholder/fake
stats. Flashcards, Memory Mode, Exam Mode, Confusing Facts, streaks, and
spaced-repetition scheduling are modeled (`Flashcard`, `Mcq` already
support it) but not yet wired to a screen — that's the next phase.

Send the next PDF whenever ready; it'll be analyzed, reported on, and
added as `content_pack_02.json` without touching what's already built.

## Requirements

- Flutter SDK (current stable channel) / Dart ≥ 3.3
- Android SDK / `sdkmanager` command-line tools
- For Termux: `pkg install flutter` (or a manually installed Flutter SDK
  on `$PATH`), plus `pkg install android-tools` if you need `adb`.
  Building Flutter/Android projects entirely inside Termux works but is
  slow and memory-hungry — a swap file of 4GB+ is strongly recommended
  on-device (see Step 1 below).

## Android status

`android/` is a full, hand-built Flutter Android platform folder (Kotlin
DSL Gradle scripts, matching the shape `flutter create` generates on
current stable Flutter). Key facts:

- **Application ID:** `com.banglasahitya.app` (stable — don't change
  once you've installed the app anywhere, Android treats a new ID as a
  different app).
- **Launcher name:** "বাংলা সাহিত্য", via a proper `res/values/strings.xml`
  resource (`android:label="@string/app_name"`), so the Bengali label
  renders correctly regardless of Unicode quirks in raw manifest attributes.
- **SDK versions** (`compileSdk`/`minSdk`/`targetSdk`) are *not* hardcoded
  — `android/app/build.gradle.kts` reads them from `flutter.compileSdkVersion`
  etc., which the Flutter Gradle plugin fills in from whatever Flutter SDK
  you actually have installed. This is intentional: it means the numbers
  never drift out of date, and you never have to hand-edit them after a
  `flutter upgrade`.
- **AGP 8.7.3 / Kotlin 2.1.0 / Gradle 8.10.2** are pinned in
  `android/settings.gradle.kts` and `android/gradle/wrapper/gradle-wrapper.properties`
  — a broadly-compatible, well-tested combination rather than the newest
  possible versions, since third-party plugins (drift, sqlite3_flutter_libs,
  google_fonts, riverpod) aren't guaranteed to support brand-new AGP major
  versions on day one.
- **Release builds are minified** (`isMinifyEnabled = true`) with a
  project-specific `proguard-rules.pro`. Since all app logic (Dart, drift,
  sqlite3 via FFI) compiles to native AOT code that R8 never touches, this
  only needed to cover the thin Android/Kotlin plugin glue.
- **Signing:** if `android/key.properties` doesn't exist, release builds
  fall back to the debug key automatically, so `flutter build apk --release`
  works out of the box on a fresh clone. Before publishing anywhere, create
  a real upload keystore and `android/key.properties`:
  ```properties
  storePassword=<password>
  keyPassword=<password>
  keyAlias=upload
  storeFile=/absolute/path/to/upload-keystore.jks
  ```
- **App icon:** a simple on-brand placeholder (open-book glyph in the
  app's teal, on the same cream used for `AppColors.lightBackground`) is
  generated at all required mipmap densities, including an adaptive icon
  for API 26+. Swap `android/app/src/main/res/mipmap-*/ic_launcher*.png`
  for a real icon whenever you have one — nothing else needs to change.
- **One binary file could not be included from this build environment:**
  `android/gradle/wrapper/gradle-wrapper.jar`. It's a small compiled Java
  bootstrap jar, and this project was prepared without network access, so
  it couldn't be downloaded here. **Step 1 below is a one-time command
  that generates it on your phone**, after which `./gradlew` and
  `flutter build apk` work normally from then on (and the jar should be
  committed to git once generated — see `.gitignore`'s note on this).

## Build APK Using Termux

**Step 1 — Termux packages (one-time, per device)**

```bash
pkg update -y && pkg upgrade -y
pkg install -y git wget unzip openjdk-17 gradle
termux-setup-storage
```

`termux-setup-storage` grants Termux access to your phone's shared
storage (so you can reach a ZIP/project sitting in `Downloads`) — Android
will show a permission prompt the first time you run it.

A 4GB+ swap file is strongly recommended before building — without it,
Gradle is commonly OOM-killed partway through a release build on phones
with 4-6GB RAM:

```bash
# Requires root, or use Termux:Boot / a swap-manager app if unrooted.
# If you can't add swap, keep org.gradle.jvmargs conservative (it already
# is, in android/gradle.properties) and close other apps while building.
```

**Step 2 — Flutter setup (one-time, per device)**

```bash
pkg install -y flutter   # or install manually and add to $PATH
flutter doctor
```

**Step 3 — Get the project**

If your ZIP/project is in your phone's Downloads folder (reachable after
Step 1's `termux-setup-storage`):

```bash
cd ~
cp -r /storage/emulated/0/Download/bangla_sahitya_app .
cd bangla_sahitya_app
```

Or clone from GitHub:

```bash
cd ~
git clone <your-repo-url>
cd bangla_sahitya_app
```

**Step 3.5 — One-time Gradle wrapper bootstrap**

Only needed the first time, since `gradle-wrapper.jar` couldn't be
pre-generated in this build environment (see "Android status" above):

```bash
cd android
gradle wrapper --gradle-version 8.10.2
cd ..
```

This uses Termux's own `gradle` package (installed in Step 1) to create
`android/gradle/wrapper/gradle-wrapper.jar` locally. After this, every
future build uses the committed `./gradlew` wrapper — this step never
needs to run again for this project.

**Step 4 — Dependencies**

```bash
flutter pub get
```

**Step 5 — Code generation** (Drift database code)

```bash
dart run build_runner build --delete-conflicting-outputs
```

**Step 6 — Build the APK**

```bash
flutter analyze          # optional, but good to check first
flutter build apk --release
```

**Step 7 — APK location**

```
build/app/outputs/flutter-apk/app-release.apk
```

Install it on the same phone with:

```bash
cp build/app/outputs/flutter-apk/app-release.apk /storage/emulated/0/Download/
# then open it from a file manager, or:
pkg install android-tools   # if you haven't already
adb install build/app/outputs/flutter-apk/app-release.apk
```

## Run (debug, on a connected device/emulator)

```bash
flutter run
```

## Whenever you add new database fields

Re-run codegen after editing anything in `lib/data/database/tables/`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Full verification sequence

Useful after any dependency or Gradle change, to confirm nothing broke:

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter build apk --debug
flutter build apk --release
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

## Known issues / offline-functionality note

- **`gradle-wrapper.jar` is not committed yet** — see Step 3.5 above; a
  one-time Termux command generates it. This is the only missing binary.
- **`google_fonts` needs network on first run.** The package fetches Noto
  Sans/Serif Bengali from Google's font CDN at runtime and caches it —
  so the very first launch (per device) needs internet, after which
  typography works offline. This breaks the "fully offline" goal in
  spec section 27 for that one first-run case. The clean fix is bundling
  the two font files as local assets (`google_fonts` supports this via
  its offline asset mode) instead of fetching them — not done yet, since
  it needs the actual font files added to the project. Everything else
  (database, content, navigation) has no network dependency at all.
- Flashcards, Memory Mode, Exam Mode, and Confusing Facts are modeled in
  the database/repositories but have no screen wired up yet (see Status).

## Next step

Send the first Bengali-literature PDF. It will be analyzed and reported
back (topics found, person/book/year/event counts, proposed new
sections, estimated MCQ count, any ambiguous parts) before any content
is integrated, per the agreed workflow.

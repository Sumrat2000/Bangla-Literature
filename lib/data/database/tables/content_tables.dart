import 'package:drift/drift.dart';

/// One row per ContentItem (person / book / event / institution / ...).
/// Nested structures (sections, facts) live in their own tables below,
/// linked by contentItemId, so a single PDF-ingestion pass can add rows
/// without ever rewriting this table's shape.
@DataClassName('ContentItemRow')
class ContentItems extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()(); // ContentType.name
  TextColumn get title => text()();
  TextColumn get shortDescription => text()();
  TextColumn get tagsJson => text().withDefault(const Constant('[]'))();
  TextColumn get relatedPersonIdsJson => text().withDefault(const Constant('[]'))();
  TextColumn get relatedBookIdsJson => text().withDefault(const Constant('[]'))();
  TextColumn get relatedTopicIdsJson => text().withDefault(const Constant('[]'))();

  // Source tracking (spec section 19)
  TextColumn get sourceType => text()(); // pdf | aiSupplementary | verified | needsVerification
  TextColumn get sourceDocument => text().nullable()();
  TextColumn get sourceLocation => text().nullable()();
  BoolColumn get examImportant => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ContentSectionRow')
class ContentSections extends Table {
  IntColumn get rowId => integer().autoIncrement()();
  TextColumn get contentItemId => text().references(ContentItems, #id)();
  IntColumn get orderIndex => integer()();
  TextColumn get heading => text()();
  TextColumn get body => text()();
}

@DataClassName('ContentFactRow')
class ContentFacts extends Table {
  TextColumn get id => text()();
  TextColumn get contentItemId => text().references(ContentItems, #id)();
  TextColumn get label => text()();
  TextColumn get value => text()();
  IntColumn get year => integer().nullable()();

  TextColumn get sourceType => text()();
  TextColumn get sourceDocument => text().nullable()();
  TextColumn get sourceLocation => text().nullable()();
  BoolColumn get examImportant => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TimelineEntryRow')
class TimelineEntriesTable extends Table {
  TextColumn get id => text()();
  IntColumn get year => integer()();
  TextColumn get title => text()();
  TextColumn get shortInfo => text()();
  TextColumn get detailedInfo => text()();
  TextColumn get relatedType => text()();
  TextColumn get contentItemId => text().references(ContentItems, #id)();
  TextColumn get relatedPersonIdsJson => text().withDefault(const Constant('[]'))();
  TextColumn get relatedBookIdsJson => text().withDefault(const Constant('[]'))();
  TextColumn get era => text().withDefault(const Constant('unknown'))();
  BoolColumn get examImportant => boolean().withDefault(const Constant(false))();
  TextColumn get sourceType => text()();
  TextColumn get sourceDocument => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FlashcardRow')
class Flashcards extends Table {
  TextColumn get id => text()();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  TextColumn get contentItemId => text().references(ContentItems, #id)();
  TextColumn get factId => text().nullable()();
  TextColumn get topicLabel => text()();

  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
  DateTimeColumn get nextDueAt => dateTime().nullable()();
  IntColumn get intervalStageIndex => integer().withDefault(const Constant(0))();
  IntColumn get forgetCount => integer().withDefault(const Constant(0))();

  TextColumn get sourceType => text()();
  TextColumn get sourceDocument => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('McqRow')
class Mcqs extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get difficulty => text()();
  TextColumn get question => text()();
  TextColumn get optionsJson => text()(); // [{id, text}, ...]
  TextColumn get correctOptionId => text()();
  TextColumn get explanation => text()();
  TextColumn get contentItemId => text().references(ContentItems, #id)();
  TextColumn get factId => text().nullable()();
  TextColumn get topicLabel => text()();

  TextColumn get sourceType => text()();
  TextColumn get sourceDocument => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Per-user progress + weakness tracking (spec sections 15, 28).
@DataClassName('TopicProgressRow')
class TopicProgress extends Table {
  TextColumn get contentItemId => text().references(ContentItems, #id)();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPracticedAt => dateTime().nullable()();
  // Marked true the first time the user opens this topic's reading detail
  // screen — feeds the "পড়া হয়েছে" badge on the Study chapter list.
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {contentItemId};
}

@DataClassName('ExamAttemptRow')
class ExamAttempts extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
  IntColumn get totalQuestions => integer()();
  IntColumn get correct => integer().withDefault(const Constant(0))();
  IntColumn get wrong => integer().withDefault(const Constant(0))();
  IntColumn get skipped => integer().withDefault(const Constant(0))();
  TextColumn get questionIdsJson => text()(); // ordered list of Mcq ids

  @override
  Set<Column> get primaryKey => {id};
}

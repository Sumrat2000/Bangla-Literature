// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ContentItemsTable extends ContentItems
    with TableInfo<$ContentItemsTable, ContentItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionMeta =
      const VerificationMeta('shortDescription');
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
      'short_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagsJsonMeta =
      const VerificationMeta('tagsJson');
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
      'tags_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _relatedPersonIdsJsonMeta =
      const VerificationMeta('relatedPersonIdsJson');
  @override
  late final GeneratedColumn<String> relatedPersonIdsJson =
      GeneratedColumn<String>('related_person_ids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _relatedBookIdsJsonMeta =
      const VerificationMeta('relatedBookIdsJson');
  @override
  late final GeneratedColumn<String> relatedBookIdsJson =
      GeneratedColumn<String>('related_book_ids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _relatedTopicIdsJsonMeta =
      const VerificationMeta('relatedTopicIdsJson');
  @override
  late final GeneratedColumn<String> relatedTopicIdsJson =
      GeneratedColumn<String>('related_topic_ids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceDocumentMeta =
      const VerificationMeta('sourceDocument');
  @override
  late final GeneratedColumn<String> sourceDocument = GeneratedColumn<String>(
      'source_document', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceLocationMeta =
      const VerificationMeta('sourceLocation');
  @override
  late final GeneratedColumn<String> sourceLocation = GeneratedColumn<String>(
      'source_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _examImportantMeta =
      const VerificationMeta('examImportant');
  @override
  late final GeneratedColumn<bool> examImportant = GeneratedColumn<bool>(
      'exam_important', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("exam_important" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        title,
        shortDescription,
        tagsJson,
        relatedPersonIdsJson,
        relatedBookIdsJson,
        relatedTopicIdsJson,
        sourceType,
        sourceDocument,
        sourceLocation,
        examImportant
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_items';
  @override
  VerificationContext validateIntegrity(Insertable<ContentItemRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
          _shortDescriptionMeta,
          shortDescription.isAcceptableOrUnknown(
              data['short_description']!, _shortDescriptionMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('tags_json')) {
      context.handle(_tagsJsonMeta,
          tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta));
    }
    if (data.containsKey('related_person_ids_json')) {
      context.handle(
          _relatedPersonIdsJsonMeta,
          relatedPersonIdsJson.isAcceptableOrUnknown(
              data['related_person_ids_json']!, _relatedPersonIdsJsonMeta));
    }
    if (data.containsKey('related_book_ids_json')) {
      context.handle(
          _relatedBookIdsJsonMeta,
          relatedBookIdsJson.isAcceptableOrUnknown(
              data['related_book_ids_json']!, _relatedBookIdsJsonMeta));
    }
    if (data.containsKey('related_topic_ids_json')) {
      context.handle(
          _relatedTopicIdsJsonMeta,
          relatedTopicIdsJson.isAcceptableOrUnknown(
              data['related_topic_ids_json']!, _relatedTopicIdsJsonMeta));
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_document')) {
      context.handle(
          _sourceDocumentMeta,
          sourceDocument.isAcceptableOrUnknown(
              data['source_document']!, _sourceDocumentMeta));
    }
    if (data.containsKey('source_location')) {
      context.handle(
          _sourceLocationMeta,
          sourceLocation.isAcceptableOrUnknown(
              data['source_location']!, _sourceLocationMeta));
    }
    if (data.containsKey('exam_important')) {
      context.handle(
          _examImportantMeta,
          examImportant.isAcceptableOrUnknown(
              data['exam_important']!, _examImportantMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContentItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentItemRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      shortDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description'])!,
      tagsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags_json'])!,
      relatedPersonIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}related_person_ids_json'])!,
      relatedBookIdsJson: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}related_book_ids_json'])!,
      relatedTopicIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}related_topic_ids_json'])!,
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceDocument: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_document']),
      sourceLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_location']),
      examImportant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}exam_important'])!,
    );
  }

  @override
  $ContentItemsTable createAlias(String alias) {
    return $ContentItemsTable(attachedDatabase, alias);
  }
}

class ContentItemRow extends DataClass implements Insertable<ContentItemRow> {
  final String id;
  final String type;
  final String title;
  final String shortDescription;
  final String tagsJson;
  final String relatedPersonIdsJson;
  final String relatedBookIdsJson;
  final String relatedTopicIdsJson;
  final String sourceType;
  final String? sourceDocument;
  final String? sourceLocation;
  final bool examImportant;
  const ContentItemRow(
      {required this.id,
      required this.type,
      required this.title,
      required this.shortDescription,
      required this.tagsJson,
      required this.relatedPersonIdsJson,
      required this.relatedBookIdsJson,
      required this.relatedTopicIdsJson,
      required this.sourceType,
      this.sourceDocument,
      this.sourceLocation,
      required this.examImportant});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['short_description'] = Variable<String>(shortDescription);
    map['tags_json'] = Variable<String>(tagsJson);
    map['related_person_ids_json'] = Variable<String>(relatedPersonIdsJson);
    map['related_book_ids_json'] = Variable<String>(relatedBookIdsJson);
    map['related_topic_ids_json'] = Variable<String>(relatedTopicIdsJson);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceDocument != null) {
      map['source_document'] = Variable<String>(sourceDocument);
    }
    if (!nullToAbsent || sourceLocation != null) {
      map['source_location'] = Variable<String>(sourceLocation);
    }
    map['exam_important'] = Variable<bool>(examImportant);
    return map;
  }

  ContentItemsCompanion toCompanion(bool nullToAbsent) {
    return ContentItemsCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      shortDescription: Value(shortDescription),
      tagsJson: Value(tagsJson),
      relatedPersonIdsJson: Value(relatedPersonIdsJson),
      relatedBookIdsJson: Value(relatedBookIdsJson),
      relatedTopicIdsJson: Value(relatedTopicIdsJson),
      sourceType: Value(sourceType),
      sourceDocument: sourceDocument == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDocument),
      sourceLocation: sourceLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceLocation),
      examImportant: Value(examImportant),
    );
  }

  factory ContentItemRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentItemRow(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      relatedPersonIdsJson:
          serializer.fromJson<String>(json['relatedPersonIdsJson']),
      relatedBookIdsJson:
          serializer.fromJson<String>(json['relatedBookIdsJson']),
      relatedTopicIdsJson:
          serializer.fromJson<String>(json['relatedTopicIdsJson']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceDocument: serializer.fromJson<String?>(json['sourceDocument']),
      sourceLocation: serializer.fromJson<String?>(json['sourceLocation']),
      examImportant: serializer.fromJson<bool>(json['examImportant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'relatedPersonIdsJson': serializer.toJson<String>(relatedPersonIdsJson),
      'relatedBookIdsJson': serializer.toJson<String>(relatedBookIdsJson),
      'relatedTopicIdsJson': serializer.toJson<String>(relatedTopicIdsJson),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceDocument': serializer.toJson<String?>(sourceDocument),
      'sourceLocation': serializer.toJson<String?>(sourceLocation),
      'examImportant': serializer.toJson<bool>(examImportant),
    };
  }

  ContentItemRow copyWith(
          {String? id,
          String? type,
          String? title,
          String? shortDescription,
          String? tagsJson,
          String? relatedPersonIdsJson,
          String? relatedBookIdsJson,
          String? relatedTopicIdsJson,
          String? sourceType,
          Value<String?> sourceDocument = const Value.absent(),
          Value<String?> sourceLocation = const Value.absent(),
          bool? examImportant}) =>
      ContentItemRow(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        shortDescription: shortDescription ?? this.shortDescription,
        tagsJson: tagsJson ?? this.tagsJson,
        relatedPersonIdsJson: relatedPersonIdsJson ?? this.relatedPersonIdsJson,
        relatedBookIdsJson: relatedBookIdsJson ?? this.relatedBookIdsJson,
        relatedTopicIdsJson: relatedTopicIdsJson ?? this.relatedTopicIdsJson,
        sourceType: sourceType ?? this.sourceType,
        sourceDocument:
            sourceDocument.present ? sourceDocument.value : this.sourceDocument,
        sourceLocation:
            sourceLocation.present ? sourceLocation.value : this.sourceLocation,
        examImportant: examImportant ?? this.examImportant,
      );
  ContentItemRow copyWithCompanion(ContentItemsCompanion data) {
    return ContentItemRow(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      relatedPersonIdsJson: data.relatedPersonIdsJson.present
          ? data.relatedPersonIdsJson.value
          : this.relatedPersonIdsJson,
      relatedBookIdsJson: data.relatedBookIdsJson.present
          ? data.relatedBookIdsJson.value
          : this.relatedBookIdsJson,
      relatedTopicIdsJson: data.relatedTopicIdsJson.present
          ? data.relatedTopicIdsJson.value
          : this.relatedTopicIdsJson,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceDocument: data.sourceDocument.present
          ? data.sourceDocument.value
          : this.sourceDocument,
      sourceLocation: data.sourceLocation.present
          ? data.sourceLocation.value
          : this.sourceLocation,
      examImportant: data.examImportant.present
          ? data.examImportant.value
          : this.examImportant,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentItemRow(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('relatedPersonIdsJson: $relatedPersonIdsJson, ')
          ..write('relatedBookIdsJson: $relatedBookIdsJson, ')
          ..write('relatedTopicIdsJson: $relatedTopicIdsJson, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('sourceLocation: $sourceLocation, ')
          ..write('examImportant: $examImportant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      type,
      title,
      shortDescription,
      tagsJson,
      relatedPersonIdsJson,
      relatedBookIdsJson,
      relatedTopicIdsJson,
      sourceType,
      sourceDocument,
      sourceLocation,
      examImportant);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentItemRow &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.shortDescription == this.shortDescription &&
          other.tagsJson == this.tagsJson &&
          other.relatedPersonIdsJson == this.relatedPersonIdsJson &&
          other.relatedBookIdsJson == this.relatedBookIdsJson &&
          other.relatedTopicIdsJson == this.relatedTopicIdsJson &&
          other.sourceType == this.sourceType &&
          other.sourceDocument == this.sourceDocument &&
          other.sourceLocation == this.sourceLocation &&
          other.examImportant == this.examImportant);
}

class ContentItemsCompanion extends UpdateCompanion<ContentItemRow> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String> shortDescription;
  final Value<String> tagsJson;
  final Value<String> relatedPersonIdsJson;
  final Value<String> relatedBookIdsJson;
  final Value<String> relatedTopicIdsJson;
  final Value<String> sourceType;
  final Value<String?> sourceDocument;
  final Value<String?> sourceLocation;
  final Value<bool> examImportant;
  final Value<int> rowid;
  const ContentItemsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.relatedPersonIdsJson = const Value.absent(),
    this.relatedBookIdsJson = const Value.absent(),
    this.relatedTopicIdsJson = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceDocument = const Value.absent(),
    this.sourceLocation = const Value.absent(),
    this.examImportant = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContentItemsCompanion.insert({
    required String id,
    required String type,
    required String title,
    required String shortDescription,
    this.tagsJson = const Value.absent(),
    this.relatedPersonIdsJson = const Value.absent(),
    this.relatedBookIdsJson = const Value.absent(),
    this.relatedTopicIdsJson = const Value.absent(),
    required String sourceType,
    this.sourceDocument = const Value.absent(),
    this.sourceLocation = const Value.absent(),
    this.examImportant = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        title = Value(title),
        shortDescription = Value(shortDescription),
        sourceType = Value(sourceType);
  static Insertable<ContentItemRow> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? shortDescription,
    Expression<String>? tagsJson,
    Expression<String>? relatedPersonIdsJson,
    Expression<String>? relatedBookIdsJson,
    Expression<String>? relatedTopicIdsJson,
    Expression<String>? sourceType,
    Expression<String>? sourceDocument,
    Expression<String>? sourceLocation,
    Expression<bool>? examImportant,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (shortDescription != null) 'short_description': shortDescription,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (relatedPersonIdsJson != null)
        'related_person_ids_json': relatedPersonIdsJson,
      if (relatedBookIdsJson != null)
        'related_book_ids_json': relatedBookIdsJson,
      if (relatedTopicIdsJson != null)
        'related_topic_ids_json': relatedTopicIdsJson,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceDocument != null) 'source_document': sourceDocument,
      if (sourceLocation != null) 'source_location': sourceLocation,
      if (examImportant != null) 'exam_important': examImportant,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContentItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? title,
      Value<String>? shortDescription,
      Value<String>? tagsJson,
      Value<String>? relatedPersonIdsJson,
      Value<String>? relatedBookIdsJson,
      Value<String>? relatedTopicIdsJson,
      Value<String>? sourceType,
      Value<String?>? sourceDocument,
      Value<String?>? sourceLocation,
      Value<bool>? examImportant,
      Value<int>? rowid}) {
    return ContentItemsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      shortDescription: shortDescription ?? this.shortDescription,
      tagsJson: tagsJson ?? this.tagsJson,
      relatedPersonIdsJson: relatedPersonIdsJson ?? this.relatedPersonIdsJson,
      relatedBookIdsJson: relatedBookIdsJson ?? this.relatedBookIdsJson,
      relatedTopicIdsJson: relatedTopicIdsJson ?? this.relatedTopicIdsJson,
      sourceType: sourceType ?? this.sourceType,
      sourceDocument: sourceDocument ?? this.sourceDocument,
      sourceLocation: sourceLocation ?? this.sourceLocation,
      examImportant: examImportant ?? this.examImportant,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (relatedPersonIdsJson.present) {
      map['related_person_ids_json'] =
          Variable<String>(relatedPersonIdsJson.value);
    }
    if (relatedBookIdsJson.present) {
      map['related_book_ids_json'] = Variable<String>(relatedBookIdsJson.value);
    }
    if (relatedTopicIdsJson.present) {
      map['related_topic_ids_json'] =
          Variable<String>(relatedTopicIdsJson.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceDocument.present) {
      map['source_document'] = Variable<String>(sourceDocument.value);
    }
    if (sourceLocation.present) {
      map['source_location'] = Variable<String>(sourceLocation.value);
    }
    if (examImportant.present) {
      map['exam_important'] = Variable<bool>(examImportant.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentItemsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('relatedPersonIdsJson: $relatedPersonIdsJson, ')
          ..write('relatedBookIdsJson: $relatedBookIdsJson, ')
          ..write('relatedTopicIdsJson: $relatedTopicIdsJson, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('sourceLocation: $sourceLocation, ')
          ..write('examImportant: $examImportant, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContentSectionsTable extends ContentSections
    with TableInfo<$ContentSectionsTable, ContentSectionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentSectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rowIdMeta = const VerificationMeta('rowId');
  @override
  late final GeneratedColumn<int> rowId = GeneratedColumn<int>(
      'row_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<String> contentItemId = GeneratedColumn<String>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _orderIndexMeta =
      const VerificationMeta('orderIndex');
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
      'order_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _headingMeta =
      const VerificationMeta('heading');
  @override
  late final GeneratedColumn<String> heading = GeneratedColumn<String>(
      'heading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [rowId, contentItemId, orderIndex, heading, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_sections';
  @override
  VerificationContext validateIntegrity(Insertable<ContentSectionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('row_id')) {
      context.handle(
          _rowIdMeta, rowId.isAcceptableOrUnknown(data['row_id']!, _rowIdMeta));
    }
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
          _orderIndexMeta,
          orderIndex.isAcceptableOrUnknown(
              data['order_index']!, _orderIndexMeta));
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('heading')) {
      context.handle(_headingMeta,
          heading.isAcceptableOrUnknown(data['heading']!, _headingMeta));
    } else if (isInserting) {
      context.missing(_headingMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rowId};
  @override
  ContentSectionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentSectionRow(
      rowId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_id'])!,
      contentItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_item_id'])!,
      orderIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_index'])!,
      heading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}heading'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
    );
  }

  @override
  $ContentSectionsTable createAlias(String alias) {
    return $ContentSectionsTable(attachedDatabase, alias);
  }
}

class ContentSectionRow extends DataClass
    implements Insertable<ContentSectionRow> {
  final int rowId;
  final String contentItemId;
  final int orderIndex;
  final String heading;
  final String body;
  const ContentSectionRow(
      {required this.rowId,
      required this.contentItemId,
      required this.orderIndex,
      required this.heading,
      required this.body});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['row_id'] = Variable<int>(rowId);
    map['content_item_id'] = Variable<String>(contentItemId);
    map['order_index'] = Variable<int>(orderIndex);
    map['heading'] = Variable<String>(heading);
    map['body'] = Variable<String>(body);
    return map;
  }

  ContentSectionsCompanion toCompanion(bool nullToAbsent) {
    return ContentSectionsCompanion(
      rowId: Value(rowId),
      contentItemId: Value(contentItemId),
      orderIndex: Value(orderIndex),
      heading: Value(heading),
      body: Value(body),
    );
  }

  factory ContentSectionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentSectionRow(
      rowId: serializer.fromJson<int>(json['rowId']),
      contentItemId: serializer.fromJson<String>(json['contentItemId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      heading: serializer.fromJson<String>(json['heading']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowId': serializer.toJson<int>(rowId),
      'contentItemId': serializer.toJson<String>(contentItemId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'heading': serializer.toJson<String>(heading),
      'body': serializer.toJson<String>(body),
    };
  }

  ContentSectionRow copyWith(
          {int? rowId,
          String? contentItemId,
          int? orderIndex,
          String? heading,
          String? body}) =>
      ContentSectionRow(
        rowId: rowId ?? this.rowId,
        contentItemId: contentItemId ?? this.contentItemId,
        orderIndex: orderIndex ?? this.orderIndex,
        heading: heading ?? this.heading,
        body: body ?? this.body,
      );
  ContentSectionRow copyWithCompanion(ContentSectionsCompanion data) {
    return ContentSectionRow(
      rowId: data.rowId.present ? data.rowId.value : this.rowId,
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      orderIndex:
          data.orderIndex.present ? data.orderIndex.value : this.orderIndex,
      heading: data.heading.present ? data.heading.value : this.heading,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentSectionRow(')
          ..write('rowId: $rowId, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('heading: $heading, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(rowId, contentItemId, orderIndex, heading, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentSectionRow &&
          other.rowId == this.rowId &&
          other.contentItemId == this.contentItemId &&
          other.orderIndex == this.orderIndex &&
          other.heading == this.heading &&
          other.body == this.body);
}

class ContentSectionsCompanion extends UpdateCompanion<ContentSectionRow> {
  final Value<int> rowId;
  final Value<String> contentItemId;
  final Value<int> orderIndex;
  final Value<String> heading;
  final Value<String> body;
  const ContentSectionsCompanion({
    this.rowId = const Value.absent(),
    this.contentItemId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.heading = const Value.absent(),
    this.body = const Value.absent(),
  });
  ContentSectionsCompanion.insert({
    this.rowId = const Value.absent(),
    required String contentItemId,
    required int orderIndex,
    required String heading,
    required String body,
  })  : contentItemId = Value(contentItemId),
        orderIndex = Value(orderIndex),
        heading = Value(heading),
        body = Value(body);
  static Insertable<ContentSectionRow> custom({
    Expression<int>? rowId,
    Expression<String>? contentItemId,
    Expression<int>? orderIndex,
    Expression<String>? heading,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (rowId != null) 'row_id': rowId,
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (heading != null) 'heading': heading,
      if (body != null) 'body': body,
    });
  }

  ContentSectionsCompanion copyWith(
      {Value<int>? rowId,
      Value<String>? contentItemId,
      Value<int>? orderIndex,
      Value<String>? heading,
      Value<String>? body}) {
    return ContentSectionsCompanion(
      rowId: rowId ?? this.rowId,
      contentItemId: contentItemId ?? this.contentItemId,
      orderIndex: orderIndex ?? this.orderIndex,
      heading: heading ?? this.heading,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowId.present) {
      map['row_id'] = Variable<int>(rowId.value);
    }
    if (contentItemId.present) {
      map['content_item_id'] = Variable<String>(contentItemId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (heading.present) {
      map['heading'] = Variable<String>(heading.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentSectionsCompanion(')
          ..write('rowId: $rowId, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('heading: $heading, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class $ContentFactsTable extends ContentFacts
    with TableInfo<$ContentFactsTable, ContentFactRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentFactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<String> contentItemId = GeneratedColumn<String>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceDocumentMeta =
      const VerificationMeta('sourceDocument');
  @override
  late final GeneratedColumn<String> sourceDocument = GeneratedColumn<String>(
      'source_document', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceLocationMeta =
      const VerificationMeta('sourceLocation');
  @override
  late final GeneratedColumn<String> sourceLocation = GeneratedColumn<String>(
      'source_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _examImportantMeta =
      const VerificationMeta('examImportant');
  @override
  late final GeneratedColumn<bool> examImportant = GeneratedColumn<bool>(
      'exam_important', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("exam_important" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        contentItemId,
        label,
        value,
        year,
        sourceType,
        sourceDocument,
        sourceLocation,
        examImportant
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_facts';
  @override
  VerificationContext validateIntegrity(Insertable<ContentFactRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_document')) {
      context.handle(
          _sourceDocumentMeta,
          sourceDocument.isAcceptableOrUnknown(
              data['source_document']!, _sourceDocumentMeta));
    }
    if (data.containsKey('source_location')) {
      context.handle(
          _sourceLocationMeta,
          sourceLocation.isAcceptableOrUnknown(
              data['source_location']!, _sourceLocationMeta));
    }
    if (data.containsKey('exam_important')) {
      context.handle(
          _examImportantMeta,
          examImportant.isAcceptableOrUnknown(
              data['exam_important']!, _examImportantMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContentFactRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentFactRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      contentItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_item_id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year']),
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceDocument: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_document']),
      sourceLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_location']),
      examImportant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}exam_important'])!,
    );
  }

  @override
  $ContentFactsTable createAlias(String alias) {
    return $ContentFactsTable(attachedDatabase, alias);
  }
}

class ContentFactRow extends DataClass implements Insertable<ContentFactRow> {
  final String id;
  final String contentItemId;
  final String label;
  final String value;
  final int? year;
  final String sourceType;
  final String? sourceDocument;
  final String? sourceLocation;
  final bool examImportant;
  const ContentFactRow(
      {required this.id,
      required this.contentItemId,
      required this.label,
      required this.value,
      this.year,
      required this.sourceType,
      this.sourceDocument,
      this.sourceLocation,
      required this.examImportant});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['content_item_id'] = Variable<String>(contentItemId);
    map['label'] = Variable<String>(label);
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceDocument != null) {
      map['source_document'] = Variable<String>(sourceDocument);
    }
    if (!nullToAbsent || sourceLocation != null) {
      map['source_location'] = Variable<String>(sourceLocation);
    }
    map['exam_important'] = Variable<bool>(examImportant);
    return map;
  }

  ContentFactsCompanion toCompanion(bool nullToAbsent) {
    return ContentFactsCompanion(
      id: Value(id),
      contentItemId: Value(contentItemId),
      label: Value(label),
      value: Value(value),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      sourceType: Value(sourceType),
      sourceDocument: sourceDocument == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDocument),
      sourceLocation: sourceLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceLocation),
      examImportant: Value(examImportant),
    );
  }

  factory ContentFactRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentFactRow(
      id: serializer.fromJson<String>(json['id']),
      contentItemId: serializer.fromJson<String>(json['contentItemId']),
      label: serializer.fromJson<String>(json['label']),
      value: serializer.fromJson<String>(json['value']),
      year: serializer.fromJson<int?>(json['year']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceDocument: serializer.fromJson<String?>(json['sourceDocument']),
      sourceLocation: serializer.fromJson<String?>(json['sourceLocation']),
      examImportant: serializer.fromJson<bool>(json['examImportant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'contentItemId': serializer.toJson<String>(contentItemId),
      'label': serializer.toJson<String>(label),
      'value': serializer.toJson<String>(value),
      'year': serializer.toJson<int?>(year),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceDocument': serializer.toJson<String?>(sourceDocument),
      'sourceLocation': serializer.toJson<String?>(sourceLocation),
      'examImportant': serializer.toJson<bool>(examImportant),
    };
  }

  ContentFactRow copyWith(
          {String? id,
          String? contentItemId,
          String? label,
          String? value,
          Value<int?> year = const Value.absent(),
          String? sourceType,
          Value<String?> sourceDocument = const Value.absent(),
          Value<String?> sourceLocation = const Value.absent(),
          bool? examImportant}) =>
      ContentFactRow(
        id: id ?? this.id,
        contentItemId: contentItemId ?? this.contentItemId,
        label: label ?? this.label,
        value: value ?? this.value,
        year: year.present ? year.value : this.year,
        sourceType: sourceType ?? this.sourceType,
        sourceDocument:
            sourceDocument.present ? sourceDocument.value : this.sourceDocument,
        sourceLocation:
            sourceLocation.present ? sourceLocation.value : this.sourceLocation,
        examImportant: examImportant ?? this.examImportant,
      );
  ContentFactRow copyWithCompanion(ContentFactsCompanion data) {
    return ContentFactRow(
      id: data.id.present ? data.id.value : this.id,
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
      year: data.year.present ? data.year.value : this.year,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceDocument: data.sourceDocument.present
          ? data.sourceDocument.value
          : this.sourceDocument,
      sourceLocation: data.sourceLocation.present
          ? data.sourceLocation.value
          : this.sourceLocation,
      examImportant: data.examImportant.present
          ? data.examImportant.value
          : this.examImportant,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentFactRow(')
          ..write('id: $id, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('year: $year, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('sourceLocation: $sourceLocation, ')
          ..write('examImportant: $examImportant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, contentItemId, label, value, year,
      sourceType, sourceDocument, sourceLocation, examImportant);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentFactRow &&
          other.id == this.id &&
          other.contentItemId == this.contentItemId &&
          other.label == this.label &&
          other.value == this.value &&
          other.year == this.year &&
          other.sourceType == this.sourceType &&
          other.sourceDocument == this.sourceDocument &&
          other.sourceLocation == this.sourceLocation &&
          other.examImportant == this.examImportant);
}

class ContentFactsCompanion extends UpdateCompanion<ContentFactRow> {
  final Value<String> id;
  final Value<String> contentItemId;
  final Value<String> label;
  final Value<String> value;
  final Value<int?> year;
  final Value<String> sourceType;
  final Value<String?> sourceDocument;
  final Value<String?> sourceLocation;
  final Value<bool> examImportant;
  final Value<int> rowid;
  const ContentFactsCompanion({
    this.id = const Value.absent(),
    this.contentItemId = const Value.absent(),
    this.label = const Value.absent(),
    this.value = const Value.absent(),
    this.year = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceDocument = const Value.absent(),
    this.sourceLocation = const Value.absent(),
    this.examImportant = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContentFactsCompanion.insert({
    required String id,
    required String contentItemId,
    required String label,
    required String value,
    this.year = const Value.absent(),
    required String sourceType,
    this.sourceDocument = const Value.absent(),
    this.sourceLocation = const Value.absent(),
    this.examImportant = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        contentItemId = Value(contentItemId),
        label = Value(label),
        value = Value(value),
        sourceType = Value(sourceType);
  static Insertable<ContentFactRow> custom({
    Expression<String>? id,
    Expression<String>? contentItemId,
    Expression<String>? label,
    Expression<String>? value,
    Expression<int>? year,
    Expression<String>? sourceType,
    Expression<String>? sourceDocument,
    Expression<String>? sourceLocation,
    Expression<bool>? examImportant,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
      if (year != null) 'year': year,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceDocument != null) 'source_document': sourceDocument,
      if (sourceLocation != null) 'source_location': sourceLocation,
      if (examImportant != null) 'exam_important': examImportant,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContentFactsCompanion copyWith(
      {Value<String>? id,
      Value<String>? contentItemId,
      Value<String>? label,
      Value<String>? value,
      Value<int?>? year,
      Value<String>? sourceType,
      Value<String?>? sourceDocument,
      Value<String?>? sourceLocation,
      Value<bool>? examImportant,
      Value<int>? rowid}) {
    return ContentFactsCompanion(
      id: id ?? this.id,
      contentItemId: contentItemId ?? this.contentItemId,
      label: label ?? this.label,
      value: value ?? this.value,
      year: year ?? this.year,
      sourceType: sourceType ?? this.sourceType,
      sourceDocument: sourceDocument ?? this.sourceDocument,
      sourceLocation: sourceLocation ?? this.sourceLocation,
      examImportant: examImportant ?? this.examImportant,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (contentItemId.present) {
      map['content_item_id'] = Variable<String>(contentItemId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceDocument.present) {
      map['source_document'] = Variable<String>(sourceDocument.value);
    }
    if (sourceLocation.present) {
      map['source_location'] = Variable<String>(sourceLocation.value);
    }
    if (examImportant.present) {
      map['exam_important'] = Variable<bool>(examImportant.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentFactsCompanion(')
          ..write('id: $id, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('year: $year, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('sourceLocation: $sourceLocation, ')
          ..write('examImportant: $examImportant, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimelineEntriesTableTable extends TimelineEntriesTable
    with TableInfo<$TimelineEntriesTableTable, TimelineEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimelineEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortInfoMeta =
      const VerificationMeta('shortInfo');
  @override
  late final GeneratedColumn<String> shortInfo = GeneratedColumn<String>(
      'short_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailedInfoMeta =
      const VerificationMeta('detailedInfo');
  @override
  late final GeneratedColumn<String> detailedInfo = GeneratedColumn<String>(
      'detailed_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relatedTypeMeta =
      const VerificationMeta('relatedType');
  @override
  late final GeneratedColumn<String> relatedType = GeneratedColumn<String>(
      'related_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<String> contentItemId = GeneratedColumn<String>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _relatedPersonIdsJsonMeta =
      const VerificationMeta('relatedPersonIdsJson');
  @override
  late final GeneratedColumn<String> relatedPersonIdsJson =
      GeneratedColumn<String>('related_person_ids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _relatedBookIdsJsonMeta =
      const VerificationMeta('relatedBookIdsJson');
  @override
  late final GeneratedColumn<String> relatedBookIdsJson =
      GeneratedColumn<String>('related_book_ids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _eraMeta = const VerificationMeta('era');
  @override
  late final GeneratedColumn<String> era = GeneratedColumn<String>(
      'era', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unknown'));
  static const VerificationMeta _examImportantMeta =
      const VerificationMeta('examImportant');
  @override
  late final GeneratedColumn<bool> examImportant = GeneratedColumn<bool>(
      'exam_important', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("exam_important" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceDocumentMeta =
      const VerificationMeta('sourceDocument');
  @override
  late final GeneratedColumn<String> sourceDocument = GeneratedColumn<String>(
      'source_document', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        year,
        title,
        shortInfo,
        detailedInfo,
        relatedType,
        contentItemId,
        relatedPersonIdsJson,
        relatedBookIdsJson,
        era,
        examImportant,
        sourceType,
        sourceDocument
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeline_entries_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimelineEntryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('short_info')) {
      context.handle(_shortInfoMeta,
          shortInfo.isAcceptableOrUnknown(data['short_info']!, _shortInfoMeta));
    } else if (isInserting) {
      context.missing(_shortInfoMeta);
    }
    if (data.containsKey('detailed_info')) {
      context.handle(
          _detailedInfoMeta,
          detailedInfo.isAcceptableOrUnknown(
              data['detailed_info']!, _detailedInfoMeta));
    } else if (isInserting) {
      context.missing(_detailedInfoMeta);
    }
    if (data.containsKey('related_type')) {
      context.handle(
          _relatedTypeMeta,
          relatedType.isAcceptableOrUnknown(
              data['related_type']!, _relatedTypeMeta));
    } else if (isInserting) {
      context.missing(_relatedTypeMeta);
    }
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('related_person_ids_json')) {
      context.handle(
          _relatedPersonIdsJsonMeta,
          relatedPersonIdsJson.isAcceptableOrUnknown(
              data['related_person_ids_json']!, _relatedPersonIdsJsonMeta));
    }
    if (data.containsKey('related_book_ids_json')) {
      context.handle(
          _relatedBookIdsJsonMeta,
          relatedBookIdsJson.isAcceptableOrUnknown(
              data['related_book_ids_json']!, _relatedBookIdsJsonMeta));
    }
    if (data.containsKey('era')) {
      context.handle(
          _eraMeta, era.isAcceptableOrUnknown(data['era']!, _eraMeta));
    }
    if (data.containsKey('exam_important')) {
      context.handle(
          _examImportantMeta,
          examImportant.isAcceptableOrUnknown(
              data['exam_important']!, _examImportantMeta));
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_document')) {
      context.handle(
          _sourceDocumentMeta,
          sourceDocument.isAcceptableOrUnknown(
              data['source_document']!, _sourceDocumentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimelineEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimelineEntryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      shortInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_info'])!,
      detailedInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}detailed_info'])!,
      relatedType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}related_type'])!,
      contentItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_item_id'])!,
      relatedPersonIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}related_person_ids_json'])!,
      relatedBookIdsJson: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}related_book_ids_json'])!,
      era: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}era'])!,
      examImportant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}exam_important'])!,
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceDocument: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_document']),
    );
  }

  @override
  $TimelineEntriesTableTable createAlias(String alias) {
    return $TimelineEntriesTableTable(attachedDatabase, alias);
  }
}

class TimelineEntryRow extends DataClass
    implements Insertable<TimelineEntryRow> {
  final String id;
  final int year;
  final String title;
  final String shortInfo;
  final String detailedInfo;
  final String relatedType;
  final String contentItemId;
  final String relatedPersonIdsJson;
  final String relatedBookIdsJson;
  final String era;
  final bool examImportant;
  final String sourceType;
  final String? sourceDocument;
  const TimelineEntryRow(
      {required this.id,
      required this.year,
      required this.title,
      required this.shortInfo,
      required this.detailedInfo,
      required this.relatedType,
      required this.contentItemId,
      required this.relatedPersonIdsJson,
      required this.relatedBookIdsJson,
      required this.era,
      required this.examImportant,
      required this.sourceType,
      this.sourceDocument});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['year'] = Variable<int>(year);
    map['title'] = Variable<String>(title);
    map['short_info'] = Variable<String>(shortInfo);
    map['detailed_info'] = Variable<String>(detailedInfo);
    map['related_type'] = Variable<String>(relatedType);
    map['content_item_id'] = Variable<String>(contentItemId);
    map['related_person_ids_json'] = Variable<String>(relatedPersonIdsJson);
    map['related_book_ids_json'] = Variable<String>(relatedBookIdsJson);
    map['era'] = Variable<String>(era);
    map['exam_important'] = Variable<bool>(examImportant);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceDocument != null) {
      map['source_document'] = Variable<String>(sourceDocument);
    }
    return map;
  }

  TimelineEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return TimelineEntriesTableCompanion(
      id: Value(id),
      year: Value(year),
      title: Value(title),
      shortInfo: Value(shortInfo),
      detailedInfo: Value(detailedInfo),
      relatedType: Value(relatedType),
      contentItemId: Value(contentItemId),
      relatedPersonIdsJson: Value(relatedPersonIdsJson),
      relatedBookIdsJson: Value(relatedBookIdsJson),
      era: Value(era),
      examImportant: Value(examImportant),
      sourceType: Value(sourceType),
      sourceDocument: sourceDocument == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDocument),
    );
  }

  factory TimelineEntryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimelineEntryRow(
      id: serializer.fromJson<String>(json['id']),
      year: serializer.fromJson<int>(json['year']),
      title: serializer.fromJson<String>(json['title']),
      shortInfo: serializer.fromJson<String>(json['shortInfo']),
      detailedInfo: serializer.fromJson<String>(json['detailedInfo']),
      relatedType: serializer.fromJson<String>(json['relatedType']),
      contentItemId: serializer.fromJson<String>(json['contentItemId']),
      relatedPersonIdsJson:
          serializer.fromJson<String>(json['relatedPersonIdsJson']),
      relatedBookIdsJson:
          serializer.fromJson<String>(json['relatedBookIdsJson']),
      era: serializer.fromJson<String>(json['era']),
      examImportant: serializer.fromJson<bool>(json['examImportant']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceDocument: serializer.fromJson<String?>(json['sourceDocument']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'year': serializer.toJson<int>(year),
      'title': serializer.toJson<String>(title),
      'shortInfo': serializer.toJson<String>(shortInfo),
      'detailedInfo': serializer.toJson<String>(detailedInfo),
      'relatedType': serializer.toJson<String>(relatedType),
      'contentItemId': serializer.toJson<String>(contentItemId),
      'relatedPersonIdsJson': serializer.toJson<String>(relatedPersonIdsJson),
      'relatedBookIdsJson': serializer.toJson<String>(relatedBookIdsJson),
      'era': serializer.toJson<String>(era),
      'examImportant': serializer.toJson<bool>(examImportant),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceDocument': serializer.toJson<String?>(sourceDocument),
    };
  }

  TimelineEntryRow copyWith(
          {String? id,
          int? year,
          String? title,
          String? shortInfo,
          String? detailedInfo,
          String? relatedType,
          String? contentItemId,
          String? relatedPersonIdsJson,
          String? relatedBookIdsJson,
          String? era,
          bool? examImportant,
          String? sourceType,
          Value<String?> sourceDocument = const Value.absent()}) =>
      TimelineEntryRow(
        id: id ?? this.id,
        year: year ?? this.year,
        title: title ?? this.title,
        shortInfo: shortInfo ?? this.shortInfo,
        detailedInfo: detailedInfo ?? this.detailedInfo,
        relatedType: relatedType ?? this.relatedType,
        contentItemId: contentItemId ?? this.contentItemId,
        relatedPersonIdsJson: relatedPersonIdsJson ?? this.relatedPersonIdsJson,
        relatedBookIdsJson: relatedBookIdsJson ?? this.relatedBookIdsJson,
        era: era ?? this.era,
        examImportant: examImportant ?? this.examImportant,
        sourceType: sourceType ?? this.sourceType,
        sourceDocument:
            sourceDocument.present ? sourceDocument.value : this.sourceDocument,
      );
  TimelineEntryRow copyWithCompanion(TimelineEntriesTableCompanion data) {
    return TimelineEntryRow(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      title: data.title.present ? data.title.value : this.title,
      shortInfo: data.shortInfo.present ? data.shortInfo.value : this.shortInfo,
      detailedInfo: data.detailedInfo.present
          ? data.detailedInfo.value
          : this.detailedInfo,
      relatedType:
          data.relatedType.present ? data.relatedType.value : this.relatedType,
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      relatedPersonIdsJson: data.relatedPersonIdsJson.present
          ? data.relatedPersonIdsJson.value
          : this.relatedPersonIdsJson,
      relatedBookIdsJson: data.relatedBookIdsJson.present
          ? data.relatedBookIdsJson.value
          : this.relatedBookIdsJson,
      era: data.era.present ? data.era.value : this.era,
      examImportant: data.examImportant.present
          ? data.examImportant.value
          : this.examImportant,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceDocument: data.sourceDocument.present
          ? data.sourceDocument.value
          : this.sourceDocument,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEntryRow(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('title: $title, ')
          ..write('shortInfo: $shortInfo, ')
          ..write('detailedInfo: $detailedInfo, ')
          ..write('relatedType: $relatedType, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('relatedPersonIdsJson: $relatedPersonIdsJson, ')
          ..write('relatedBookIdsJson: $relatedBookIdsJson, ')
          ..write('era: $era, ')
          ..write('examImportant: $examImportant, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      year,
      title,
      shortInfo,
      detailedInfo,
      relatedType,
      contentItemId,
      relatedPersonIdsJson,
      relatedBookIdsJson,
      era,
      examImportant,
      sourceType,
      sourceDocument);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineEntryRow &&
          other.id == this.id &&
          other.year == this.year &&
          other.title == this.title &&
          other.shortInfo == this.shortInfo &&
          other.detailedInfo == this.detailedInfo &&
          other.relatedType == this.relatedType &&
          other.contentItemId == this.contentItemId &&
          other.relatedPersonIdsJson == this.relatedPersonIdsJson &&
          other.relatedBookIdsJson == this.relatedBookIdsJson &&
          other.era == this.era &&
          other.examImportant == this.examImportant &&
          other.sourceType == this.sourceType &&
          other.sourceDocument == this.sourceDocument);
}

class TimelineEntriesTableCompanion extends UpdateCompanion<TimelineEntryRow> {
  final Value<String> id;
  final Value<int> year;
  final Value<String> title;
  final Value<String> shortInfo;
  final Value<String> detailedInfo;
  final Value<String> relatedType;
  final Value<String> contentItemId;
  final Value<String> relatedPersonIdsJson;
  final Value<String> relatedBookIdsJson;
  final Value<String> era;
  final Value<bool> examImportant;
  final Value<String> sourceType;
  final Value<String?> sourceDocument;
  final Value<int> rowid;
  const TimelineEntriesTableCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.title = const Value.absent(),
    this.shortInfo = const Value.absent(),
    this.detailedInfo = const Value.absent(),
    this.relatedType = const Value.absent(),
    this.contentItemId = const Value.absent(),
    this.relatedPersonIdsJson = const Value.absent(),
    this.relatedBookIdsJson = const Value.absent(),
    this.era = const Value.absent(),
    this.examImportant = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceDocument = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimelineEntriesTableCompanion.insert({
    required String id,
    required int year,
    required String title,
    required String shortInfo,
    required String detailedInfo,
    required String relatedType,
    required String contentItemId,
    this.relatedPersonIdsJson = const Value.absent(),
    this.relatedBookIdsJson = const Value.absent(),
    this.era = const Value.absent(),
    this.examImportant = const Value.absent(),
    required String sourceType,
    this.sourceDocument = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        year = Value(year),
        title = Value(title),
        shortInfo = Value(shortInfo),
        detailedInfo = Value(detailedInfo),
        relatedType = Value(relatedType),
        contentItemId = Value(contentItemId),
        sourceType = Value(sourceType);
  static Insertable<TimelineEntryRow> custom({
    Expression<String>? id,
    Expression<int>? year,
    Expression<String>? title,
    Expression<String>? shortInfo,
    Expression<String>? detailedInfo,
    Expression<String>? relatedType,
    Expression<String>? contentItemId,
    Expression<String>? relatedPersonIdsJson,
    Expression<String>? relatedBookIdsJson,
    Expression<String>? era,
    Expression<bool>? examImportant,
    Expression<String>? sourceType,
    Expression<String>? sourceDocument,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (title != null) 'title': title,
      if (shortInfo != null) 'short_info': shortInfo,
      if (detailedInfo != null) 'detailed_info': detailedInfo,
      if (relatedType != null) 'related_type': relatedType,
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (relatedPersonIdsJson != null)
        'related_person_ids_json': relatedPersonIdsJson,
      if (relatedBookIdsJson != null)
        'related_book_ids_json': relatedBookIdsJson,
      if (era != null) 'era': era,
      if (examImportant != null) 'exam_important': examImportant,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceDocument != null) 'source_document': sourceDocument,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimelineEntriesTableCompanion copyWith(
      {Value<String>? id,
      Value<int>? year,
      Value<String>? title,
      Value<String>? shortInfo,
      Value<String>? detailedInfo,
      Value<String>? relatedType,
      Value<String>? contentItemId,
      Value<String>? relatedPersonIdsJson,
      Value<String>? relatedBookIdsJson,
      Value<String>? era,
      Value<bool>? examImportant,
      Value<String>? sourceType,
      Value<String?>? sourceDocument,
      Value<int>? rowid}) {
    return TimelineEntriesTableCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      title: title ?? this.title,
      shortInfo: shortInfo ?? this.shortInfo,
      detailedInfo: detailedInfo ?? this.detailedInfo,
      relatedType: relatedType ?? this.relatedType,
      contentItemId: contentItemId ?? this.contentItemId,
      relatedPersonIdsJson: relatedPersonIdsJson ?? this.relatedPersonIdsJson,
      relatedBookIdsJson: relatedBookIdsJson ?? this.relatedBookIdsJson,
      era: era ?? this.era,
      examImportant: examImportant ?? this.examImportant,
      sourceType: sourceType ?? this.sourceType,
      sourceDocument: sourceDocument ?? this.sourceDocument,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (shortInfo.present) {
      map['short_info'] = Variable<String>(shortInfo.value);
    }
    if (detailedInfo.present) {
      map['detailed_info'] = Variable<String>(detailedInfo.value);
    }
    if (relatedType.present) {
      map['related_type'] = Variable<String>(relatedType.value);
    }
    if (contentItemId.present) {
      map['content_item_id'] = Variable<String>(contentItemId.value);
    }
    if (relatedPersonIdsJson.present) {
      map['related_person_ids_json'] =
          Variable<String>(relatedPersonIdsJson.value);
    }
    if (relatedBookIdsJson.present) {
      map['related_book_ids_json'] = Variable<String>(relatedBookIdsJson.value);
    }
    if (era.present) {
      map['era'] = Variable<String>(era.value);
    }
    if (examImportant.present) {
      map['exam_important'] = Variable<bool>(examImportant.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceDocument.present) {
      map['source_document'] = Variable<String>(sourceDocument.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('title: $title, ')
          ..write('shortInfo: $shortInfo, ')
          ..write('detailedInfo: $detailedInfo, ')
          ..write('relatedType: $relatedType, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('relatedPersonIdsJson: $relatedPersonIdsJson, ')
          ..write('relatedBookIdsJson: $relatedBookIdsJson, ')
          ..write('era: $era, ')
          ..write('examImportant: $examImportant, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlashcardsTable extends Flashcards
    with TableInfo<$FlashcardsTable, FlashcardRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<String> contentItemId = GeneratedColumn<String>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _factIdMeta = const VerificationMeta('factId');
  @override
  late final GeneratedColumn<String> factId = GeneratedColumn<String>(
      'fact_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _topicLabelMeta =
      const VerificationMeta('topicLabel');
  @override
  late final GeneratedColumn<String> topicLabel = GeneratedColumn<String>(
      'topic_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastReviewedAtMeta =
      const VerificationMeta('lastReviewedAt');
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>('last_reviewed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextDueAtMeta =
      const VerificationMeta('nextDueAt');
  @override
  late final GeneratedColumn<DateTime> nextDueAt = GeneratedColumn<DateTime>(
      'next_due_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _intervalStageIndexMeta =
      const VerificationMeta('intervalStageIndex');
  @override
  late final GeneratedColumn<int> intervalStageIndex = GeneratedColumn<int>(
      'interval_stage_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _forgetCountMeta =
      const VerificationMeta('forgetCount');
  @override
  late final GeneratedColumn<int> forgetCount = GeneratedColumn<int>(
      'forget_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceDocumentMeta =
      const VerificationMeta('sourceDocument');
  @override
  late final GeneratedColumn<String> sourceDocument = GeneratedColumn<String>(
      'source_document', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        question,
        answer,
        contentItemId,
        factId,
        topicLabel,
        lastReviewedAt,
        nextDueAt,
        intervalStageIndex,
        forgetCount,
        sourceType,
        sourceDocument
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcards';
  @override
  VerificationContext validateIntegrity(Insertable<FlashcardRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('fact_id')) {
      context.handle(_factIdMeta,
          factId.isAcceptableOrUnknown(data['fact_id']!, _factIdMeta));
    }
    if (data.containsKey('topic_label')) {
      context.handle(
          _topicLabelMeta,
          topicLabel.isAcceptableOrUnknown(
              data['topic_label']!, _topicLabelMeta));
    } else if (isInserting) {
      context.missing(_topicLabelMeta);
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
          _lastReviewedAtMeta,
          lastReviewedAt.isAcceptableOrUnknown(
              data['last_reviewed_at']!, _lastReviewedAtMeta));
    }
    if (data.containsKey('next_due_at')) {
      context.handle(
          _nextDueAtMeta,
          nextDueAt.isAcceptableOrUnknown(
              data['next_due_at']!, _nextDueAtMeta));
    }
    if (data.containsKey('interval_stage_index')) {
      context.handle(
          _intervalStageIndexMeta,
          intervalStageIndex.isAcceptableOrUnknown(
              data['interval_stage_index']!, _intervalStageIndexMeta));
    }
    if (data.containsKey('forget_count')) {
      context.handle(
          _forgetCountMeta,
          forgetCount.isAcceptableOrUnknown(
              data['forget_count']!, _forgetCountMeta));
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_document')) {
      context.handle(
          _sourceDocumentMeta,
          sourceDocument.isAcceptableOrUnknown(
              data['source_document']!, _sourceDocumentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlashcardRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlashcardRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      contentItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_item_id'])!,
      factId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fact_id']),
      topicLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic_label'])!,
      lastReviewedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_reviewed_at']),
      nextDueAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_due_at']),
      intervalStageIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}interval_stage_index'])!,
      forgetCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}forget_count'])!,
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceDocument: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_document']),
    );
  }

  @override
  $FlashcardsTable createAlias(String alias) {
    return $FlashcardsTable(attachedDatabase, alias);
  }
}

class FlashcardRow extends DataClass implements Insertable<FlashcardRow> {
  final String id;
  final String question;
  final String answer;
  final String contentItemId;
  final String? factId;
  final String topicLabel;
  final DateTime? lastReviewedAt;
  final DateTime? nextDueAt;
  final int intervalStageIndex;
  final int forgetCount;
  final String sourceType;
  final String? sourceDocument;
  const FlashcardRow(
      {required this.id,
      required this.question,
      required this.answer,
      required this.contentItemId,
      this.factId,
      required this.topicLabel,
      this.lastReviewedAt,
      this.nextDueAt,
      required this.intervalStageIndex,
      required this.forgetCount,
      required this.sourceType,
      this.sourceDocument});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question'] = Variable<String>(question);
    map['answer'] = Variable<String>(answer);
    map['content_item_id'] = Variable<String>(contentItemId);
    if (!nullToAbsent || factId != null) {
      map['fact_id'] = Variable<String>(factId);
    }
    map['topic_label'] = Variable<String>(topicLabel);
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    if (!nullToAbsent || nextDueAt != null) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt);
    }
    map['interval_stage_index'] = Variable<int>(intervalStageIndex);
    map['forget_count'] = Variable<int>(forgetCount);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceDocument != null) {
      map['source_document'] = Variable<String>(sourceDocument);
    }
    return map;
  }

  FlashcardsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardsCompanion(
      id: Value(id),
      question: Value(question),
      answer: Value(answer),
      contentItemId: Value(contentItemId),
      factId:
          factId == null && nullToAbsent ? const Value.absent() : Value(factId),
      topicLabel: Value(topicLabel),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      nextDueAt: nextDueAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueAt),
      intervalStageIndex: Value(intervalStageIndex),
      forgetCount: Value(forgetCount),
      sourceType: Value(sourceType),
      sourceDocument: sourceDocument == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDocument),
    );
  }

  factory FlashcardRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlashcardRow(
      id: serializer.fromJson<String>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
      contentItemId: serializer.fromJson<String>(json['contentItemId']),
      factId: serializer.fromJson<String?>(json['factId']),
      topicLabel: serializer.fromJson<String>(json['topicLabel']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      nextDueAt: serializer.fromJson<DateTime?>(json['nextDueAt']),
      intervalStageIndex: serializer.fromJson<int>(json['intervalStageIndex']),
      forgetCount: serializer.fromJson<int>(json['forgetCount']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceDocument: serializer.fromJson<String?>(json['sourceDocument']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'contentItemId': serializer.toJson<String>(contentItemId),
      'factId': serializer.toJson<String?>(factId),
      'topicLabel': serializer.toJson<String>(topicLabel),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'nextDueAt': serializer.toJson<DateTime?>(nextDueAt),
      'intervalStageIndex': serializer.toJson<int>(intervalStageIndex),
      'forgetCount': serializer.toJson<int>(forgetCount),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceDocument': serializer.toJson<String?>(sourceDocument),
    };
  }

  FlashcardRow copyWith(
          {String? id,
          String? question,
          String? answer,
          String? contentItemId,
          Value<String?> factId = const Value.absent(),
          String? topicLabel,
          Value<DateTime?> lastReviewedAt = const Value.absent(),
          Value<DateTime?> nextDueAt = const Value.absent(),
          int? intervalStageIndex,
          int? forgetCount,
          String? sourceType,
          Value<String?> sourceDocument = const Value.absent()}) =>
      FlashcardRow(
        id: id ?? this.id,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        contentItemId: contentItemId ?? this.contentItemId,
        factId: factId.present ? factId.value : this.factId,
        topicLabel: topicLabel ?? this.topicLabel,
        lastReviewedAt:
            lastReviewedAt.present ? lastReviewedAt.value : this.lastReviewedAt,
        nextDueAt: nextDueAt.present ? nextDueAt.value : this.nextDueAt,
        intervalStageIndex: intervalStageIndex ?? this.intervalStageIndex,
        forgetCount: forgetCount ?? this.forgetCount,
        sourceType: sourceType ?? this.sourceType,
        sourceDocument:
            sourceDocument.present ? sourceDocument.value : this.sourceDocument,
      );
  FlashcardRow copyWithCompanion(FlashcardsCompanion data) {
    return FlashcardRow(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      answer: data.answer.present ? data.answer.value : this.answer,
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      factId: data.factId.present ? data.factId.value : this.factId,
      topicLabel:
          data.topicLabel.present ? data.topicLabel.value : this.topicLabel,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      nextDueAt: data.nextDueAt.present ? data.nextDueAt.value : this.nextDueAt,
      intervalStageIndex: data.intervalStageIndex.present
          ? data.intervalStageIndex.value
          : this.intervalStageIndex,
      forgetCount:
          data.forgetCount.present ? data.forgetCount.value : this.forgetCount,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceDocument: data.sourceDocument.present
          ? data.sourceDocument.value
          : this.sourceDocument,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardRow(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('factId: $factId, ')
          ..write('topicLabel: $topicLabel, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('intervalStageIndex: $intervalStageIndex, ')
          ..write('forgetCount: $forgetCount, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      question,
      answer,
      contentItemId,
      factId,
      topicLabel,
      lastReviewedAt,
      nextDueAt,
      intervalStageIndex,
      forgetCount,
      sourceType,
      sourceDocument);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlashcardRow &&
          other.id == this.id &&
          other.question == this.question &&
          other.answer == this.answer &&
          other.contentItemId == this.contentItemId &&
          other.factId == this.factId &&
          other.topicLabel == this.topicLabel &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.nextDueAt == this.nextDueAt &&
          other.intervalStageIndex == this.intervalStageIndex &&
          other.forgetCount == this.forgetCount &&
          other.sourceType == this.sourceType &&
          other.sourceDocument == this.sourceDocument);
}

class FlashcardsCompanion extends UpdateCompanion<FlashcardRow> {
  final Value<String> id;
  final Value<String> question;
  final Value<String> answer;
  final Value<String> contentItemId;
  final Value<String?> factId;
  final Value<String> topicLabel;
  final Value<DateTime?> lastReviewedAt;
  final Value<DateTime?> nextDueAt;
  final Value<int> intervalStageIndex;
  final Value<int> forgetCount;
  final Value<String> sourceType;
  final Value<String?> sourceDocument;
  final Value<int> rowid;
  const FlashcardsCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.contentItemId = const Value.absent(),
    this.factId = const Value.absent(),
    this.topicLabel = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.intervalStageIndex = const Value.absent(),
    this.forgetCount = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceDocument = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlashcardsCompanion.insert({
    required String id,
    required String question,
    required String answer,
    required String contentItemId,
    this.factId = const Value.absent(),
    required String topicLabel,
    this.lastReviewedAt = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.intervalStageIndex = const Value.absent(),
    this.forgetCount = const Value.absent(),
    required String sourceType,
    this.sourceDocument = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        question = Value(question),
        answer = Value(answer),
        contentItemId = Value(contentItemId),
        topicLabel = Value(topicLabel),
        sourceType = Value(sourceType);
  static Insertable<FlashcardRow> custom({
    Expression<String>? id,
    Expression<String>? question,
    Expression<String>? answer,
    Expression<String>? contentItemId,
    Expression<String>? factId,
    Expression<String>? topicLabel,
    Expression<DateTime>? lastReviewedAt,
    Expression<DateTime>? nextDueAt,
    Expression<int>? intervalStageIndex,
    Expression<int>? forgetCount,
    Expression<String>? sourceType,
    Expression<String>? sourceDocument,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (answer != null) 'answer': answer,
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (factId != null) 'fact_id': factId,
      if (topicLabel != null) 'topic_label': topicLabel,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (nextDueAt != null) 'next_due_at': nextDueAt,
      if (intervalStageIndex != null)
        'interval_stage_index': intervalStageIndex,
      if (forgetCount != null) 'forget_count': forgetCount,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceDocument != null) 'source_document': sourceDocument,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlashcardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? question,
      Value<String>? answer,
      Value<String>? contentItemId,
      Value<String?>? factId,
      Value<String>? topicLabel,
      Value<DateTime?>? lastReviewedAt,
      Value<DateTime?>? nextDueAt,
      Value<int>? intervalStageIndex,
      Value<int>? forgetCount,
      Value<String>? sourceType,
      Value<String?>? sourceDocument,
      Value<int>? rowid}) {
    return FlashcardsCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      contentItemId: contentItemId ?? this.contentItemId,
      factId: factId ?? this.factId,
      topicLabel: topicLabel ?? this.topicLabel,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      nextDueAt: nextDueAt ?? this.nextDueAt,
      intervalStageIndex: intervalStageIndex ?? this.intervalStageIndex,
      forgetCount: forgetCount ?? this.forgetCount,
      sourceType: sourceType ?? this.sourceType,
      sourceDocument: sourceDocument ?? this.sourceDocument,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (contentItemId.present) {
      map['content_item_id'] = Variable<String>(contentItemId.value);
    }
    if (factId.present) {
      map['fact_id'] = Variable<String>(factId.value);
    }
    if (topicLabel.present) {
      map['topic_label'] = Variable<String>(topicLabel.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (nextDueAt.present) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt.value);
    }
    if (intervalStageIndex.present) {
      map['interval_stage_index'] = Variable<int>(intervalStageIndex.value);
    }
    if (forgetCount.present) {
      map['forget_count'] = Variable<int>(forgetCount.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceDocument.present) {
      map['source_document'] = Variable<String>(sourceDocument.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('factId: $factId, ')
          ..write('topicLabel: $topicLabel, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('intervalStageIndex: $intervalStageIndex, ')
          ..write('forgetCount: $forgetCount, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $McqsTable extends Mcqs with TableInfo<$McqsTable, McqRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $McqsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
      'difficulty', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsJsonMeta =
      const VerificationMeta('optionsJson');
  @override
  late final GeneratedColumn<String> optionsJson = GeneratedColumn<String>(
      'options_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctOptionIdMeta =
      const VerificationMeta('correctOptionId');
  @override
  late final GeneratedColumn<String> correctOptionId = GeneratedColumn<String>(
      'correct_option_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<String> contentItemId = GeneratedColumn<String>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _factIdMeta = const VerificationMeta('factId');
  @override
  late final GeneratedColumn<String> factId = GeneratedColumn<String>(
      'fact_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _topicLabelMeta =
      const VerificationMeta('topicLabel');
  @override
  late final GeneratedColumn<String> topicLabel = GeneratedColumn<String>(
      'topic_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceDocumentMeta =
      const VerificationMeta('sourceDocument');
  @override
  late final GeneratedColumn<String> sourceDocument = GeneratedColumn<String>(
      'source_document', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        difficulty,
        question,
        optionsJson,
        correctOptionId,
        explanation,
        contentItemId,
        factId,
        topicLabel,
        sourceType,
        sourceDocument
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mcqs';
  @override
  VerificationContext validateIntegrity(Insertable<McqRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('options_json')) {
      context.handle(
          _optionsJsonMeta,
          optionsJson.isAcceptableOrUnknown(
              data['options_json']!, _optionsJsonMeta));
    } else if (isInserting) {
      context.missing(_optionsJsonMeta);
    }
    if (data.containsKey('correct_option_id')) {
      context.handle(
          _correctOptionIdMeta,
          correctOptionId.isAcceptableOrUnknown(
              data['correct_option_id']!, _correctOptionIdMeta));
    } else if (isInserting) {
      context.missing(_correctOptionIdMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('fact_id')) {
      context.handle(_factIdMeta,
          factId.isAcceptableOrUnknown(data['fact_id']!, _factIdMeta));
    }
    if (data.containsKey('topic_label')) {
      context.handle(
          _topicLabelMeta,
          topicLabel.isAcceptableOrUnknown(
              data['topic_label']!, _topicLabelMeta));
    } else if (isInserting) {
      context.missing(_topicLabelMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_document')) {
      context.handle(
          _sourceDocumentMeta,
          sourceDocument.isAcceptableOrUnknown(
              data['source_document']!, _sourceDocumentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  McqRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return McqRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficulty'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      optionsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options_json'])!,
      correctOptionId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}correct_option_id'])!,
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation'])!,
      contentItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_item_id'])!,
      factId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fact_id']),
      topicLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic_label'])!,
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceDocument: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_document']),
    );
  }

  @override
  $McqsTable createAlias(String alias) {
    return $McqsTable(attachedDatabase, alias);
  }
}

class McqRow extends DataClass implements Insertable<McqRow> {
  final String id;
  final String type;
  final String difficulty;
  final String question;
  final String optionsJson;
  final String correctOptionId;
  final String explanation;
  final String contentItemId;
  final String? factId;
  final String topicLabel;
  final String sourceType;
  final String? sourceDocument;
  const McqRow(
      {required this.id,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.optionsJson,
      required this.correctOptionId,
      required this.explanation,
      required this.contentItemId,
      this.factId,
      required this.topicLabel,
      required this.sourceType,
      this.sourceDocument});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['difficulty'] = Variable<String>(difficulty);
    map['question'] = Variable<String>(question);
    map['options_json'] = Variable<String>(optionsJson);
    map['correct_option_id'] = Variable<String>(correctOptionId);
    map['explanation'] = Variable<String>(explanation);
    map['content_item_id'] = Variable<String>(contentItemId);
    if (!nullToAbsent || factId != null) {
      map['fact_id'] = Variable<String>(factId);
    }
    map['topic_label'] = Variable<String>(topicLabel);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceDocument != null) {
      map['source_document'] = Variable<String>(sourceDocument);
    }
    return map;
  }

  McqsCompanion toCompanion(bool nullToAbsent) {
    return McqsCompanion(
      id: Value(id),
      type: Value(type),
      difficulty: Value(difficulty),
      question: Value(question),
      optionsJson: Value(optionsJson),
      correctOptionId: Value(correctOptionId),
      explanation: Value(explanation),
      contentItemId: Value(contentItemId),
      factId:
          factId == null && nullToAbsent ? const Value.absent() : Value(factId),
      topicLabel: Value(topicLabel),
      sourceType: Value(sourceType),
      sourceDocument: sourceDocument == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDocument),
    );
  }

  factory McqRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return McqRow(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      question: serializer.fromJson<String>(json['question']),
      optionsJson: serializer.fromJson<String>(json['optionsJson']),
      correctOptionId: serializer.fromJson<String>(json['correctOptionId']),
      explanation: serializer.fromJson<String>(json['explanation']),
      contentItemId: serializer.fromJson<String>(json['contentItemId']),
      factId: serializer.fromJson<String?>(json['factId']),
      topicLabel: serializer.fromJson<String>(json['topicLabel']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceDocument: serializer.fromJson<String?>(json['sourceDocument']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'difficulty': serializer.toJson<String>(difficulty),
      'question': serializer.toJson<String>(question),
      'optionsJson': serializer.toJson<String>(optionsJson),
      'correctOptionId': serializer.toJson<String>(correctOptionId),
      'explanation': serializer.toJson<String>(explanation),
      'contentItemId': serializer.toJson<String>(contentItemId),
      'factId': serializer.toJson<String?>(factId),
      'topicLabel': serializer.toJson<String>(topicLabel),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceDocument': serializer.toJson<String?>(sourceDocument),
    };
  }

  McqRow copyWith(
          {String? id,
          String? type,
          String? difficulty,
          String? question,
          String? optionsJson,
          String? correctOptionId,
          String? explanation,
          String? contentItemId,
          Value<String?> factId = const Value.absent(),
          String? topicLabel,
          String? sourceType,
          Value<String?> sourceDocument = const Value.absent()}) =>
      McqRow(
        id: id ?? this.id,
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        question: question ?? this.question,
        optionsJson: optionsJson ?? this.optionsJson,
        correctOptionId: correctOptionId ?? this.correctOptionId,
        explanation: explanation ?? this.explanation,
        contentItemId: contentItemId ?? this.contentItemId,
        factId: factId.present ? factId.value : this.factId,
        topicLabel: topicLabel ?? this.topicLabel,
        sourceType: sourceType ?? this.sourceType,
        sourceDocument:
            sourceDocument.present ? sourceDocument.value : this.sourceDocument,
      );
  McqRow copyWithCompanion(McqsCompanion data) {
    return McqRow(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      question: data.question.present ? data.question.value : this.question,
      optionsJson:
          data.optionsJson.present ? data.optionsJson.value : this.optionsJson,
      correctOptionId: data.correctOptionId.present
          ? data.correctOptionId.value
          : this.correctOptionId,
      explanation:
          data.explanation.present ? data.explanation.value : this.explanation,
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      factId: data.factId.present ? data.factId.value : this.factId,
      topicLabel:
          data.topicLabel.present ? data.topicLabel.value : this.topicLabel,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceDocument: data.sourceDocument.present
          ? data.sourceDocument.value
          : this.sourceDocument,
    );
  }

  @override
  String toString() {
    return (StringBuffer('McqRow(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('difficulty: $difficulty, ')
          ..write('question: $question, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctOptionId: $correctOptionId, ')
          ..write('explanation: $explanation, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('factId: $factId, ')
          ..write('topicLabel: $topicLabel, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      type,
      difficulty,
      question,
      optionsJson,
      correctOptionId,
      explanation,
      contentItemId,
      factId,
      topicLabel,
      sourceType,
      sourceDocument);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is McqRow &&
          other.id == this.id &&
          other.type == this.type &&
          other.difficulty == this.difficulty &&
          other.question == this.question &&
          other.optionsJson == this.optionsJson &&
          other.correctOptionId == this.correctOptionId &&
          other.explanation == this.explanation &&
          other.contentItemId == this.contentItemId &&
          other.factId == this.factId &&
          other.topicLabel == this.topicLabel &&
          other.sourceType == this.sourceType &&
          other.sourceDocument == this.sourceDocument);
}

class McqsCompanion extends UpdateCompanion<McqRow> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> difficulty;
  final Value<String> question;
  final Value<String> optionsJson;
  final Value<String> correctOptionId;
  final Value<String> explanation;
  final Value<String> contentItemId;
  final Value<String?> factId;
  final Value<String> topicLabel;
  final Value<String> sourceType;
  final Value<String?> sourceDocument;
  final Value<int> rowid;
  const McqsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.question = const Value.absent(),
    this.optionsJson = const Value.absent(),
    this.correctOptionId = const Value.absent(),
    this.explanation = const Value.absent(),
    this.contentItemId = const Value.absent(),
    this.factId = const Value.absent(),
    this.topicLabel = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceDocument = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  McqsCompanion.insert({
    required String id,
    required String type,
    required String difficulty,
    required String question,
    required String optionsJson,
    required String correctOptionId,
    required String explanation,
    required String contentItemId,
    this.factId = const Value.absent(),
    required String topicLabel,
    required String sourceType,
    this.sourceDocument = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        difficulty = Value(difficulty),
        question = Value(question),
        optionsJson = Value(optionsJson),
        correctOptionId = Value(correctOptionId),
        explanation = Value(explanation),
        contentItemId = Value(contentItemId),
        topicLabel = Value(topicLabel),
        sourceType = Value(sourceType);
  static Insertable<McqRow> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? difficulty,
    Expression<String>? question,
    Expression<String>? optionsJson,
    Expression<String>? correctOptionId,
    Expression<String>? explanation,
    Expression<String>? contentItemId,
    Expression<String>? factId,
    Expression<String>? topicLabel,
    Expression<String>? sourceType,
    Expression<String>? sourceDocument,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (difficulty != null) 'difficulty': difficulty,
      if (question != null) 'question': question,
      if (optionsJson != null) 'options_json': optionsJson,
      if (correctOptionId != null) 'correct_option_id': correctOptionId,
      if (explanation != null) 'explanation': explanation,
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (factId != null) 'fact_id': factId,
      if (topicLabel != null) 'topic_label': topicLabel,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceDocument != null) 'source_document': sourceDocument,
      if (rowid != null) 'rowid': rowid,
    });
  }

  McqsCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? difficulty,
      Value<String>? question,
      Value<String>? optionsJson,
      Value<String>? correctOptionId,
      Value<String>? explanation,
      Value<String>? contentItemId,
      Value<String?>? factId,
      Value<String>? topicLabel,
      Value<String>? sourceType,
      Value<String?>? sourceDocument,
      Value<int>? rowid}) {
    return McqsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      optionsJson: optionsJson ?? this.optionsJson,
      correctOptionId: correctOptionId ?? this.correctOptionId,
      explanation: explanation ?? this.explanation,
      contentItemId: contentItemId ?? this.contentItemId,
      factId: factId ?? this.factId,
      topicLabel: topicLabel ?? this.topicLabel,
      sourceType: sourceType ?? this.sourceType,
      sourceDocument: sourceDocument ?? this.sourceDocument,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (optionsJson.present) {
      map['options_json'] = Variable<String>(optionsJson.value);
    }
    if (correctOptionId.present) {
      map['correct_option_id'] = Variable<String>(correctOptionId.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (contentItemId.present) {
      map['content_item_id'] = Variable<String>(contentItemId.value);
    }
    if (factId.present) {
      map['fact_id'] = Variable<String>(factId.value);
    }
    if (topicLabel.present) {
      map['topic_label'] = Variable<String>(topicLabel.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceDocument.present) {
      map['source_document'] = Variable<String>(sourceDocument.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('McqsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('difficulty: $difficulty, ')
          ..write('question: $question, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctOptionId: $correctOptionId, ')
          ..write('explanation: $explanation, ')
          ..write('contentItemId: $contentItemId, ')
          ..write('factId: $factId, ')
          ..write('topicLabel: $topicLabel, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceDocument: $sourceDocument, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicProgressTable extends TopicProgress
    with TableInfo<$TopicProgressTable, TopicProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentItemIdMeta =
      const VerificationMeta('contentItemId');
  @override
  late final GeneratedColumn<String> contentItemId = GeneratedColumn<String>(
      'content_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES content_items (id)'));
  static const VerificationMeta _correctCountMeta =
      const VerificationMeta('correctCount');
  @override
  late final GeneratedColumn<int> correctCount = GeneratedColumn<int>(
      'correct_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _wrongCountMeta =
      const VerificationMeta('wrongCount');
  @override
  late final GeneratedColumn<int> wrongCount = GeneratedColumn<int>(
      'wrong_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastPracticedAtMeta =
      const VerificationMeta('lastPracticedAt');
  @override
  late final GeneratedColumn<DateTime> lastPracticedAt =
      GeneratedColumn<DateTime>('last_practiced_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [contentItemId, correctCount, wrongCount, lastPracticedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topic_progress';
  @override
  VerificationContext validateIntegrity(Insertable<TopicProgressRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content_item_id')) {
      context.handle(
          _contentItemIdMeta,
          contentItemId.isAcceptableOrUnknown(
              data['content_item_id']!, _contentItemIdMeta));
    } else if (isInserting) {
      context.missing(_contentItemIdMeta);
    }
    if (data.containsKey('correct_count')) {
      context.handle(
          _correctCountMeta,
          correctCount.isAcceptableOrUnknown(
              data['correct_count']!, _correctCountMeta));
    }
    if (data.containsKey('wrong_count')) {
      context.handle(
          _wrongCountMeta,
          wrongCount.isAcceptableOrUnknown(
              data['wrong_count']!, _wrongCountMeta));
    }
    if (data.containsKey('last_practiced_at')) {
      context.handle(
          _lastPracticedAtMeta,
          lastPracticedAt.isAcceptableOrUnknown(
              data['last_practiced_at']!, _lastPracticedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {contentItemId};
  @override
  TopicProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicProgressRow(
      contentItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_item_id'])!,
      correctCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_count'])!,
      wrongCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wrong_count'])!,
      lastPracticedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_practiced_at']),
    );
  }

  @override
  $TopicProgressTable createAlias(String alias) {
    return $TopicProgressTable(attachedDatabase, alias);
  }
}

class TopicProgressRow extends DataClass
    implements Insertable<TopicProgressRow> {
  final String contentItemId;
  final int correctCount;
  final int wrongCount;
  final DateTime? lastPracticedAt;
  const TopicProgressRow(
      {required this.contentItemId,
      required this.correctCount,
      required this.wrongCount,
      this.lastPracticedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content_item_id'] = Variable<String>(contentItemId);
    map['correct_count'] = Variable<int>(correctCount);
    map['wrong_count'] = Variable<int>(wrongCount);
    if (!nullToAbsent || lastPracticedAt != null) {
      map['last_practiced_at'] = Variable<DateTime>(lastPracticedAt);
    }
    return map;
  }

  TopicProgressCompanion toCompanion(bool nullToAbsent) {
    return TopicProgressCompanion(
      contentItemId: Value(contentItemId),
      correctCount: Value(correctCount),
      wrongCount: Value(wrongCount),
      lastPracticedAt: lastPracticedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPracticedAt),
    );
  }

  factory TopicProgressRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicProgressRow(
      contentItemId: serializer.fromJson<String>(json['contentItemId']),
      correctCount: serializer.fromJson<int>(json['correctCount']),
      wrongCount: serializer.fromJson<int>(json['wrongCount']),
      lastPracticedAt: serializer.fromJson<DateTime?>(json['lastPracticedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'contentItemId': serializer.toJson<String>(contentItemId),
      'correctCount': serializer.toJson<int>(correctCount),
      'wrongCount': serializer.toJson<int>(wrongCount),
      'lastPracticedAt': serializer.toJson<DateTime?>(lastPracticedAt),
    };
  }

  TopicProgressRow copyWith(
          {String? contentItemId,
          int? correctCount,
          int? wrongCount,
          Value<DateTime?> lastPracticedAt = const Value.absent()}) =>
      TopicProgressRow(
        contentItemId: contentItemId ?? this.contentItemId,
        correctCount: correctCount ?? this.correctCount,
        wrongCount: wrongCount ?? this.wrongCount,
        lastPracticedAt: lastPracticedAt.present
            ? lastPracticedAt.value
            : this.lastPracticedAt,
      );
  TopicProgressRow copyWithCompanion(TopicProgressCompanion data) {
    return TopicProgressRow(
      contentItemId: data.contentItemId.present
          ? data.contentItemId.value
          : this.contentItemId,
      correctCount: data.correctCount.present
          ? data.correctCount.value
          : this.correctCount,
      wrongCount:
          data.wrongCount.present ? data.wrongCount.value : this.wrongCount,
      lastPracticedAt: data.lastPracticedAt.present
          ? data.lastPracticedAt.value
          : this.lastPracticedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicProgressRow(')
          ..write('contentItemId: $contentItemId, ')
          ..write('correctCount: $correctCount, ')
          ..write('wrongCount: $wrongCount, ')
          ..write('lastPracticedAt: $lastPracticedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(contentItemId, correctCount, wrongCount, lastPracticedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicProgressRow &&
          other.contentItemId == this.contentItemId &&
          other.correctCount == this.correctCount &&
          other.wrongCount == this.wrongCount &&
          other.lastPracticedAt == this.lastPracticedAt);
}

class TopicProgressCompanion extends UpdateCompanion<TopicProgressRow> {
  final Value<String> contentItemId;
  final Value<int> correctCount;
  final Value<int> wrongCount;
  final Value<DateTime?> lastPracticedAt;
  final Value<int> rowid;
  const TopicProgressCompanion({
    this.contentItemId = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
    this.lastPracticedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicProgressCompanion.insert({
    required String contentItemId,
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
    this.lastPracticedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : contentItemId = Value(contentItemId);
  static Insertable<TopicProgressRow> custom({
    Expression<String>? contentItemId,
    Expression<int>? correctCount,
    Expression<int>? wrongCount,
    Expression<DateTime>? lastPracticedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (contentItemId != null) 'content_item_id': contentItemId,
      if (correctCount != null) 'correct_count': correctCount,
      if (wrongCount != null) 'wrong_count': wrongCount,
      if (lastPracticedAt != null) 'last_practiced_at': lastPracticedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicProgressCompanion copyWith(
      {Value<String>? contentItemId,
      Value<int>? correctCount,
      Value<int>? wrongCount,
      Value<DateTime?>? lastPracticedAt,
      Value<int>? rowid}) {
    return TopicProgressCompanion(
      contentItemId: contentItemId ?? this.contentItemId,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      lastPracticedAt: lastPracticedAt ?? this.lastPracticedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (contentItemId.present) {
      map['content_item_id'] = Variable<String>(contentItemId.value);
    }
    if (correctCount.present) {
      map['correct_count'] = Variable<int>(correctCount.value);
    }
    if (wrongCount.present) {
      map['wrong_count'] = Variable<int>(wrongCount.value);
    }
    if (lastPracticedAt.present) {
      map['last_practiced_at'] = Variable<DateTime>(lastPracticedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicProgressCompanion(')
          ..write('contentItemId: $contentItemId, ')
          ..write('correctCount: $correctCount, ')
          ..write('wrongCount: $wrongCount, ')
          ..write('lastPracticedAt: $lastPracticedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExamAttemptsTable extends ExamAttempts
    with TableInfo<$ExamAttemptsTable, ExamAttemptRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishedAtMeta =
      const VerificationMeta('finishedAt');
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
      'finished_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _totalQuestionsMeta =
      const VerificationMeta('totalQuestions');
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
      'total_questions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _correctMeta =
      const VerificationMeta('correct');
  @override
  late final GeneratedColumn<int> correct = GeneratedColumn<int>(
      'correct', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _wrongMeta = const VerificationMeta('wrong');
  @override
  late final GeneratedColumn<int> wrong = GeneratedColumn<int>(
      'wrong', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _skippedMeta =
      const VerificationMeta('skipped');
  @override
  late final GeneratedColumn<int> skipped = GeneratedColumn<int>(
      'skipped', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _questionIdsJsonMeta =
      const VerificationMeta('questionIdsJson');
  @override
  late final GeneratedColumn<String> questionIdsJson = GeneratedColumn<String>(
      'question_ids_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        startedAt,
        finishedAt,
        totalQuestions,
        correct,
        wrong,
        skipped,
        questionIdsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_attempts';
  @override
  VerificationContext validateIntegrity(Insertable<ExamAttemptRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
          _finishedAtMeta,
          finishedAt.isAcceptableOrUnknown(
              data['finished_at']!, _finishedAtMeta));
    }
    if (data.containsKey('total_questions')) {
      context.handle(
          _totalQuestionsMeta,
          totalQuestions.isAcceptableOrUnknown(
              data['total_questions']!, _totalQuestionsMeta));
    } else if (isInserting) {
      context.missing(_totalQuestionsMeta);
    }
    if (data.containsKey('correct')) {
      context.handle(_correctMeta,
          correct.isAcceptableOrUnknown(data['correct']!, _correctMeta));
    }
    if (data.containsKey('wrong')) {
      context.handle(
          _wrongMeta, wrong.isAcceptableOrUnknown(data['wrong']!, _wrongMeta));
    }
    if (data.containsKey('skipped')) {
      context.handle(_skippedMeta,
          skipped.isAcceptableOrUnknown(data['skipped']!, _skippedMeta));
    }
    if (data.containsKey('question_ids_json')) {
      context.handle(
          _questionIdsJsonMeta,
          questionIdsJson.isAcceptableOrUnknown(
              data['question_ids_json']!, _questionIdsJsonMeta));
    } else if (isInserting) {
      context.missing(_questionIdsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExamAttemptRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamAttemptRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      finishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finished_at']),
      totalQuestions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_questions'])!,
      correct: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct'])!,
      wrong: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wrong'])!,
      skipped: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}skipped'])!,
      questionIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}question_ids_json'])!,
    );
  }

  @override
  $ExamAttemptsTable createAlias(String alias) {
    return $ExamAttemptsTable(attachedDatabase, alias);
  }
}

class ExamAttemptRow extends DataClass implements Insertable<ExamAttemptRow> {
  final String id;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final int totalQuestions;
  final int correct;
  final int wrong;
  final int skipped;
  final String questionIdsJson;
  const ExamAttemptRow(
      {required this.id,
      required this.startedAt,
      this.finishedAt,
      required this.totalQuestions,
      required this.correct,
      required this.wrong,
      required this.skipped,
      required this.questionIdsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    map['total_questions'] = Variable<int>(totalQuestions);
    map['correct'] = Variable<int>(correct);
    map['wrong'] = Variable<int>(wrong);
    map['skipped'] = Variable<int>(skipped);
    map['question_ids_json'] = Variable<String>(questionIdsJson);
    return map;
  }

  ExamAttemptsCompanion toCompanion(bool nullToAbsent) {
    return ExamAttemptsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      totalQuestions: Value(totalQuestions),
      correct: Value(correct),
      wrong: Value(wrong),
      skipped: Value(skipped),
      questionIdsJson: Value(questionIdsJson),
    );
  }

  factory ExamAttemptRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamAttemptRow(
      id: serializer.fromJson<String>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      correct: serializer.fromJson<int>(json['correct']),
      wrong: serializer.fromJson<int>(json['wrong']),
      skipped: serializer.fromJson<int>(json['skipped']),
      questionIdsJson: serializer.fromJson<String>(json['questionIdsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'correct': serializer.toJson<int>(correct),
      'wrong': serializer.toJson<int>(wrong),
      'skipped': serializer.toJson<int>(skipped),
      'questionIdsJson': serializer.toJson<String>(questionIdsJson),
    };
  }

  ExamAttemptRow copyWith(
          {String? id,
          DateTime? startedAt,
          Value<DateTime?> finishedAt = const Value.absent(),
          int? totalQuestions,
          int? correct,
          int? wrong,
          int? skipped,
          String? questionIdsJson}) =>
      ExamAttemptRow(
        id: id ?? this.id,
        startedAt: startedAt ?? this.startedAt,
        finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
        totalQuestions: totalQuestions ?? this.totalQuestions,
        correct: correct ?? this.correct,
        wrong: wrong ?? this.wrong,
        skipped: skipped ?? this.skipped,
        questionIdsJson: questionIdsJson ?? this.questionIdsJson,
      );
  ExamAttemptRow copyWithCompanion(ExamAttemptsCompanion data) {
    return ExamAttemptRow(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt:
          data.finishedAt.present ? data.finishedAt.value : this.finishedAt,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      correct: data.correct.present ? data.correct.value : this.correct,
      wrong: data.wrong.present ? data.wrong.value : this.wrong,
      skipped: data.skipped.present ? data.skipped.value : this.skipped,
      questionIdsJson: data.questionIdsJson.present
          ? data.questionIdsJson.value
          : this.questionIdsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamAttemptRow(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('correct: $correct, ')
          ..write('wrong: $wrong, ')
          ..write('skipped: $skipped, ')
          ..write('questionIdsJson: $questionIdsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startedAt, finishedAt, totalQuestions,
      correct, wrong, skipped, questionIdsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamAttemptRow &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.totalQuestions == this.totalQuestions &&
          other.correct == this.correct &&
          other.wrong == this.wrong &&
          other.skipped == this.skipped &&
          other.questionIdsJson == this.questionIdsJson);
}

class ExamAttemptsCompanion extends UpdateCompanion<ExamAttemptRow> {
  final Value<String> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<int> totalQuestions;
  final Value<int> correct;
  final Value<int> wrong;
  final Value<int> skipped;
  final Value<String> questionIdsJson;
  final Value<int> rowid;
  const ExamAttemptsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.correct = const Value.absent(),
    this.wrong = const Value.absent(),
    this.skipped = const Value.absent(),
    this.questionIdsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExamAttemptsCompanion.insert({
    required String id,
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    required int totalQuestions,
    this.correct = const Value.absent(),
    this.wrong = const Value.absent(),
    this.skipped = const Value.absent(),
    required String questionIdsJson,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        startedAt = Value(startedAt),
        totalQuestions = Value(totalQuestions),
        questionIdsJson = Value(questionIdsJson);
  static Insertable<ExamAttemptRow> custom({
    Expression<String>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? finishedAt,
    Expression<int>? totalQuestions,
    Expression<int>? correct,
    Expression<int>? wrong,
    Expression<int>? skipped,
    Expression<String>? questionIdsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (correct != null) 'correct': correct,
      if (wrong != null) 'wrong': wrong,
      if (skipped != null) 'skipped': skipped,
      if (questionIdsJson != null) 'question_ids_json': questionIdsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExamAttemptsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? startedAt,
      Value<DateTime?>? finishedAt,
      Value<int>? totalQuestions,
      Value<int>? correct,
      Value<int>? wrong,
      Value<int>? skipped,
      Value<String>? questionIdsJson,
      Value<int>? rowid}) {
    return ExamAttemptsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      correct: correct ?? this.correct,
      wrong: wrong ?? this.wrong,
      skipped: skipped ?? this.skipped,
      questionIdsJson: questionIdsJson ?? this.questionIdsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (correct.present) {
      map['correct'] = Variable<int>(correct.value);
    }
    if (wrong.present) {
      map['wrong'] = Variable<int>(wrong.value);
    }
    if (skipped.present) {
      map['skipped'] = Variable<int>(skipped.value);
    }
    if (questionIdsJson.present) {
      map['question_ids_json'] = Variable<String>(questionIdsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('correct: $correct, ')
          ..write('wrong: $wrong, ')
          ..write('skipped: $skipped, ')
          ..write('questionIdsJson: $questionIdsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContentItemsTable contentItems = $ContentItemsTable(this);
  late final $ContentSectionsTable contentSections =
      $ContentSectionsTable(this);
  late final $ContentFactsTable contentFacts = $ContentFactsTable(this);
  late final $TimelineEntriesTableTable timelineEntriesTable =
      $TimelineEntriesTableTable(this);
  late final $FlashcardsTable flashcards = $FlashcardsTable(this);
  late final $McqsTable mcqs = $McqsTable(this);
  late final $TopicProgressTable topicProgress = $TopicProgressTable(this);
  late final $ExamAttemptsTable examAttempts = $ExamAttemptsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        contentItems,
        contentSections,
        contentFacts,
        timelineEntriesTable,
        flashcards,
        mcqs,
        topicProgress,
        examAttempts
      ];
}

typedef $$ContentItemsTableCreateCompanionBuilder = ContentItemsCompanion
    Function({
  required String id,
  required String type,
  required String title,
  required String shortDescription,
  Value<String> tagsJson,
  Value<String> relatedPersonIdsJson,
  Value<String> relatedBookIdsJson,
  Value<String> relatedTopicIdsJson,
  required String sourceType,
  Value<String?> sourceDocument,
  Value<String?> sourceLocation,
  Value<bool> examImportant,
  Value<int> rowid,
});
typedef $$ContentItemsTableUpdateCompanionBuilder = ContentItemsCompanion
    Function({
  Value<String> id,
  Value<String> type,
  Value<String> title,
  Value<String> shortDescription,
  Value<String> tagsJson,
  Value<String> relatedPersonIdsJson,
  Value<String> relatedBookIdsJson,
  Value<String> relatedTopicIdsJson,
  Value<String> sourceType,
  Value<String?> sourceDocument,
  Value<String?> sourceLocation,
  Value<bool> examImportant,
  Value<int> rowid,
});

final class $$ContentItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ContentItemsTable, ContentItemRow> {
  $$ContentItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ContentSectionsTable, List<ContentSectionRow>>
      _contentSectionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.contentSections,
              aliasName:
                  'content_items__id__content_sections__content_item_id');

  $$ContentSectionsTableProcessedTableManager get contentSectionsRefs {
    final manager =
        $$ContentSectionsTableTableManager($_db, $_db.contentSections).filter(
            (f) => f.contentItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_contentSectionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ContentFactsTable, List<ContentFactRow>>
      _contentFactsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.contentFacts,
              aliasName: 'content_items__id__content_facts__content_item_id');

  $$ContentFactsTableProcessedTableManager get contentFactsRefs {
    final manager = $$ContentFactsTableTableManager($_db, $_db.contentFacts)
        .filter(
            (f) => f.contentItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_contentFactsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TimelineEntriesTableTable, List<TimelineEntryRow>>
      _timelineEntriesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.timelineEntriesTable,
              aliasName:
                  'content_items__id__timeline_entries_table__content_item_id');

  $$TimelineEntriesTableTableProcessedTableManager
      get timelineEntriesTableRefs {
    final manager = $$TimelineEntriesTableTableTableManager(
            $_db, $_db.timelineEntriesTable)
        .filter(
            (f) => f.contentItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_timelineEntriesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FlashcardsTable, List<FlashcardRow>>
      _flashcardsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.flashcards,
              aliasName: 'content_items__id__flashcards__content_item_id');

  $$FlashcardsTableProcessedTableManager get flashcardsRefs {
    final manager = $$FlashcardsTableTableManager($_db, $_db.flashcards).filter(
        (f) => f.contentItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_flashcardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$McqsTable, List<McqRow>> _mcqsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mcqs,
          aliasName: 'content_items__id__mcqs__content_item_id');

  $$McqsTableProcessedTableManager get mcqsRefs {
    final manager = $$McqsTableTableManager($_db, $_db.mcqs).filter(
        (f) => f.contentItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mcqsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TopicProgressTable, List<TopicProgressRow>>
      _topicProgressRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.topicProgress,
              aliasName: 'content_items__id__topic_progress__content_item_id');

  $$TopicProgressTableProcessedTableManager get topicProgressRefs {
    final manager = $$TopicProgressTableTableManager($_db, $_db.topicProgress)
        .filter(
            (f) => f.contentItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicProgressRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ContentItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ContentItemsTable> {
  $$ContentItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagsJson => $composableBuilder(
      column: $table.tagsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedPersonIdsJson => $composableBuilder(
      column: $table.relatedPersonIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedBookIdsJson => $composableBuilder(
      column: $table.relatedBookIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedTopicIdsJson => $composableBuilder(
      column: $table.relatedTopicIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get examImportant => $composableBuilder(
      column: $table.examImportant, builder: (column) => ColumnFilters(column));

  Expression<bool> contentSectionsRefs(
      Expression<bool> Function($$ContentSectionsTableFilterComposer f) f) {
    final $$ContentSectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentSections,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentSectionsTableFilterComposer(
              $db: $db,
              $table: $db.contentSections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> contentFactsRefs(
      Expression<bool> Function($$ContentFactsTableFilterComposer f) f) {
    final $$ContentFactsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentFacts,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentFactsTableFilterComposer(
              $db: $db,
              $table: $db.contentFacts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> timelineEntriesTableRefs(
      Expression<bool> Function($$TimelineEntriesTableTableFilterComposer f)
          f) {
    final $$TimelineEntriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timelineEntriesTable,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimelineEntriesTableTableFilterComposer(
              $db: $db,
              $table: $db.timelineEntriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> flashcardsRefs(
      Expression<bool> Function($$FlashcardsTableFilterComposer f) f) {
    final $$FlashcardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.flashcards,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FlashcardsTableFilterComposer(
              $db: $db,
              $table: $db.flashcards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mcqsRefs(
      Expression<bool> Function($$McqsTableFilterComposer f) f) {
    final $$McqsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mcqs,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$McqsTableFilterComposer(
              $db: $db,
              $table: $db.mcqs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> topicProgressRefs(
      Expression<bool> Function($$TopicProgressTableFilterComposer f) f) {
    final $$TopicProgressTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.topicProgress,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicProgressTableFilterComposer(
              $db: $db,
              $table: $db.topicProgress,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ContentItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentItemsTable> {
  $$ContentItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagsJson => $composableBuilder(
      column: $table.tagsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedPersonIdsJson => $composableBuilder(
      column: $table.relatedPersonIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedBookIdsJson => $composableBuilder(
      column: $table.relatedBookIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedTopicIdsJson => $composableBuilder(
      column: $table.relatedTopicIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get examImportant => $composableBuilder(
      column: $table.examImportant,
      builder: (column) => ColumnOrderings(column));
}

class $$ContentItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentItemsTable> {
  $$ContentItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription, builder: (column) => column);

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<String> get relatedPersonIdsJson => $composableBuilder(
      column: $table.relatedPersonIdsJson, builder: (column) => column);

  GeneratedColumn<String> get relatedBookIdsJson => $composableBuilder(
      column: $table.relatedBookIdsJson, builder: (column) => column);

  GeneratedColumn<String> get relatedTopicIdsJson => $composableBuilder(
      column: $table.relatedTopicIdsJson, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument, builder: (column) => column);

  GeneratedColumn<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation, builder: (column) => column);

  GeneratedColumn<bool> get examImportant => $composableBuilder(
      column: $table.examImportant, builder: (column) => column);

  Expression<T> contentSectionsRefs<T extends Object>(
      Expression<T> Function($$ContentSectionsTableAnnotationComposer a) f) {
    final $$ContentSectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentSections,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentSectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentSections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> contentFactsRefs<T extends Object>(
      Expression<T> Function($$ContentFactsTableAnnotationComposer a) f) {
    final $$ContentFactsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.contentFacts,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentFactsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentFacts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> timelineEntriesTableRefs<T extends Object>(
      Expression<T> Function($$TimelineEntriesTableTableAnnotationComposer a)
          f) {
    final $$TimelineEntriesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.timelineEntriesTable,
            getReferencedColumn: (t) => t.contentItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TimelineEntriesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.timelineEntriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> flashcardsRefs<T extends Object>(
      Expression<T> Function($$FlashcardsTableAnnotationComposer a) f) {
    final $$FlashcardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.flashcards,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FlashcardsTableAnnotationComposer(
              $db: $db,
              $table: $db.flashcards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mcqsRefs<T extends Object>(
      Expression<T> Function($$McqsTableAnnotationComposer a) f) {
    final $$McqsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mcqs,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$McqsTableAnnotationComposer(
              $db: $db,
              $table: $db.mcqs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> topicProgressRefs<T extends Object>(
      Expression<T> Function($$TopicProgressTableAnnotationComposer a) f) {
    final $$TopicProgressTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.topicProgress,
        getReferencedColumn: (t) => t.contentItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicProgressTableAnnotationComposer(
              $db: $db,
              $table: $db.topicProgress,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ContentItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentItemsTable,
    ContentItemRow,
    $$ContentItemsTableFilterComposer,
    $$ContentItemsTableOrderingComposer,
    $$ContentItemsTableAnnotationComposer,
    $$ContentItemsTableCreateCompanionBuilder,
    $$ContentItemsTableUpdateCompanionBuilder,
    (ContentItemRow, $$ContentItemsTableReferences),
    ContentItemRow,
    PrefetchHooks Function(
        {bool contentSectionsRefs,
        bool contentFactsRefs,
        bool timelineEntriesTableRefs,
        bool flashcardsRefs,
        bool mcqsRefs,
        bool topicProgressRefs})> {
  $$ContentItemsTableTableManager(_$AppDatabase db, $ContentItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> shortDescription = const Value.absent(),
            Value<String> tagsJson = const Value.absent(),
            Value<String> relatedPersonIdsJson = const Value.absent(),
            Value<String> relatedBookIdsJson = const Value.absent(),
            Value<String> relatedTopicIdsJson = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String?> sourceDocument = const Value.absent(),
            Value<String?> sourceLocation = const Value.absent(),
            Value<bool> examImportant = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ContentItemsCompanion(
            id: id,
            type: type,
            title: title,
            shortDescription: shortDescription,
            tagsJson: tagsJson,
            relatedPersonIdsJson: relatedPersonIdsJson,
            relatedBookIdsJson: relatedBookIdsJson,
            relatedTopicIdsJson: relatedTopicIdsJson,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            sourceLocation: sourceLocation,
            examImportant: examImportant,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String title,
            required String shortDescription,
            Value<String> tagsJson = const Value.absent(),
            Value<String> relatedPersonIdsJson = const Value.absent(),
            Value<String> relatedBookIdsJson = const Value.absent(),
            Value<String> relatedTopicIdsJson = const Value.absent(),
            required String sourceType,
            Value<String?> sourceDocument = const Value.absent(),
            Value<String?> sourceLocation = const Value.absent(),
            Value<bool> examImportant = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ContentItemsCompanion.insert(
            id: id,
            type: type,
            title: title,
            shortDescription: shortDescription,
            tagsJson: tagsJson,
            relatedPersonIdsJson: relatedPersonIdsJson,
            relatedBookIdsJson: relatedBookIdsJson,
            relatedTopicIdsJson: relatedTopicIdsJson,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            sourceLocation: sourceLocation,
            examImportant: examImportant,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ContentItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {contentSectionsRefs = false,
              contentFactsRefs = false,
              timelineEntriesTableRefs = false,
              flashcardsRefs = false,
              mcqsRefs = false,
              topicProgressRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contentSectionsRefs) db.contentSections,
                if (contentFactsRefs) db.contentFacts,
                if (timelineEntriesTableRefs) db.timelineEntriesTable,
                if (flashcardsRefs) db.flashcards,
                if (mcqsRefs) db.mcqs,
                if (topicProgressRefs) db.topicProgress
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contentSectionsRefs)
                    await $_getPrefetchedData<ContentItemRow,
                            $ContentItemsTable, ContentSectionRow>(
                        currentTable: table,
                        referencedTable: $$ContentItemsTableReferences
                            ._contentSectionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .contentSectionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items),
                  if (contentFactsRefs)
                    await $_getPrefetchedData<ContentItemRow,
                            $ContentItemsTable, ContentFactRow>(
                        currentTable: table,
                        referencedTable: $$ContentItemsTableReferences
                            ._contentFactsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .contentFactsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items),
                  if (timelineEntriesTableRefs)
                    await $_getPrefetchedData<ContentItemRow,
                            $ContentItemsTable, TimelineEntryRow>(
                        currentTable: table,
                        referencedTable: $$ContentItemsTableReferences
                            ._timelineEntriesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .timelineEntriesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items),
                  if (flashcardsRefs)
                    await $_getPrefetchedData<ContentItemRow, $ContentItemsTable,
                            FlashcardRow>(
                        currentTable: table,
                        referencedTable: $$ContentItemsTableReferences
                            ._flashcardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .flashcardsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items),
                  if (mcqsRefs)
                    await $_getPrefetchedData<ContentItemRow,
                            $ContentItemsTable, McqRow>(
                        currentTable: table,
                        referencedTable:
                            $$ContentItemsTableReferences._mcqsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .mcqsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items),
                  if (topicProgressRefs)
                    await $_getPrefetchedData<ContentItemRow,
                            $ContentItemsTable, TopicProgressRow>(
                        currentTable: table,
                        referencedTable: $$ContentItemsTableReferences
                            ._topicProgressRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ContentItemsTableReferences(db, table, p0)
                                .topicProgressRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.contentItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ContentItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentItemsTable,
    ContentItemRow,
    $$ContentItemsTableFilterComposer,
    $$ContentItemsTableOrderingComposer,
    $$ContentItemsTableAnnotationComposer,
    $$ContentItemsTableCreateCompanionBuilder,
    $$ContentItemsTableUpdateCompanionBuilder,
    (ContentItemRow, $$ContentItemsTableReferences),
    ContentItemRow,
    PrefetchHooks Function(
        {bool contentSectionsRefs,
        bool contentFactsRefs,
        bool timelineEntriesTableRefs,
        bool flashcardsRefs,
        bool mcqsRefs,
        bool topicProgressRefs})>;
typedef $$ContentSectionsTableCreateCompanionBuilder = ContentSectionsCompanion
    Function({
  Value<int> rowId,
  required String contentItemId,
  required int orderIndex,
  required String heading,
  required String body,
});
typedef $$ContentSectionsTableUpdateCompanionBuilder = ContentSectionsCompanion
    Function({
  Value<int> rowId,
  Value<String> contentItemId,
  Value<int> orderIndex,
  Value<String> heading,
  Value<String> body,
});

final class $$ContentSectionsTableReferences extends BaseReferences<
    _$AppDatabase, $ContentSectionsTable, ContentSectionRow> {
  $$ContentSectionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems
          .createAlias('content_sections__content_item_id__content_items__id');

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<String>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ContentSectionsTableFilterComposer
    extends Composer<_$AppDatabase, $ContentSectionsTable> {
  $$ContentSectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get rowId => $composableBuilder(
      column: $table.rowId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderIndex => $composableBuilder(
      column: $table.orderIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get heading => $composableBuilder(
      column: $table.heading, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentSectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentSectionsTable> {
  $$ContentSectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get rowId => $composableBuilder(
      column: $table.rowId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderIndex => $composableBuilder(
      column: $table.orderIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get heading => $composableBuilder(
      column: $table.heading, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentSectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentSectionsTable> {
  $$ContentSectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get rowId =>
      $composableBuilder(column: $table.rowId, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
      column: $table.orderIndex, builder: (column) => column);

  GeneratedColumn<String> get heading =>
      $composableBuilder(column: $table.heading, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentSectionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentSectionsTable,
    ContentSectionRow,
    $$ContentSectionsTableFilterComposer,
    $$ContentSectionsTableOrderingComposer,
    $$ContentSectionsTableAnnotationComposer,
    $$ContentSectionsTableCreateCompanionBuilder,
    $$ContentSectionsTableUpdateCompanionBuilder,
    (ContentSectionRow, $$ContentSectionsTableReferences),
    ContentSectionRow,
    PrefetchHooks Function({bool contentItemId})> {
  $$ContentSectionsTableTableManager(
      _$AppDatabase db, $ContentSectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentSectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentSectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentSectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> rowId = const Value.absent(),
            Value<String> contentItemId = const Value.absent(),
            Value<int> orderIndex = const Value.absent(),
            Value<String> heading = const Value.absent(),
            Value<String> body = const Value.absent(),
          }) =>
              ContentSectionsCompanion(
            rowId: rowId,
            contentItemId: contentItemId,
            orderIndex: orderIndex,
            heading: heading,
            body: body,
          ),
          createCompanionCallback: ({
            Value<int> rowId = const Value.absent(),
            required String contentItemId,
            required int orderIndex,
            required String heading,
            required String body,
          }) =>
              ContentSectionsCompanion.insert(
            rowId: rowId,
            contentItemId: contentItemId,
            orderIndex: orderIndex,
            heading: heading,
            body: body,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ContentSectionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({contentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable: $$ContentSectionsTableReferences
                        ._contentItemIdTable(db),
                    referencedColumn: $$ContentSectionsTableReferences
                        ._contentItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ContentSectionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentSectionsTable,
    ContentSectionRow,
    $$ContentSectionsTableFilterComposer,
    $$ContentSectionsTableOrderingComposer,
    $$ContentSectionsTableAnnotationComposer,
    $$ContentSectionsTableCreateCompanionBuilder,
    $$ContentSectionsTableUpdateCompanionBuilder,
    (ContentSectionRow, $$ContentSectionsTableReferences),
    ContentSectionRow,
    PrefetchHooks Function({bool contentItemId})>;
typedef $$ContentFactsTableCreateCompanionBuilder = ContentFactsCompanion
    Function({
  required String id,
  required String contentItemId,
  required String label,
  required String value,
  Value<int?> year,
  required String sourceType,
  Value<String?> sourceDocument,
  Value<String?> sourceLocation,
  Value<bool> examImportant,
  Value<int> rowid,
});
typedef $$ContentFactsTableUpdateCompanionBuilder = ContentFactsCompanion
    Function({
  Value<String> id,
  Value<String> contentItemId,
  Value<String> label,
  Value<String> value,
  Value<int?> year,
  Value<String> sourceType,
  Value<String?> sourceDocument,
  Value<String?> sourceLocation,
  Value<bool> examImportant,
  Value<int> rowid,
});

final class $$ContentFactsTableReferences
    extends BaseReferences<_$AppDatabase, $ContentFactsTable, ContentFactRow> {
  $$ContentFactsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems
          .createAlias('content_facts__content_item_id__content_items__id');

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<String>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ContentFactsTableFilterComposer
    extends Composer<_$AppDatabase, $ContentFactsTable> {
  $$ContentFactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get examImportant => $composableBuilder(
      column: $table.examImportant, builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentFactsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentFactsTable> {
  $$ContentFactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get examImportant => $composableBuilder(
      column: $table.examImportant,
      builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentFactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentFactsTable> {
  $$ContentFactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument, builder: (column) => column);

  GeneratedColumn<String> get sourceLocation => $composableBuilder(
      column: $table.sourceLocation, builder: (column) => column);

  GeneratedColumn<bool> get examImportant => $composableBuilder(
      column: $table.examImportant, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ContentFactsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentFactsTable,
    ContentFactRow,
    $$ContentFactsTableFilterComposer,
    $$ContentFactsTableOrderingComposer,
    $$ContentFactsTableAnnotationComposer,
    $$ContentFactsTableCreateCompanionBuilder,
    $$ContentFactsTableUpdateCompanionBuilder,
    (ContentFactRow, $$ContentFactsTableReferences),
    ContentFactRow,
    PrefetchHooks Function({bool contentItemId})> {
  $$ContentFactsTableTableManager(_$AppDatabase db, $ContentFactsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentFactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentFactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentFactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> contentItemId = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int?> year = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String?> sourceDocument = const Value.absent(),
            Value<String?> sourceLocation = const Value.absent(),
            Value<bool> examImportant = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ContentFactsCompanion(
            id: id,
            contentItemId: contentItemId,
            label: label,
            value: value,
            year: year,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            sourceLocation: sourceLocation,
            examImportant: examImportant,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String contentItemId,
            required String label,
            required String value,
            Value<int?> year = const Value.absent(),
            required String sourceType,
            Value<String?> sourceDocument = const Value.absent(),
            Value<String?> sourceLocation = const Value.absent(),
            Value<bool> examImportant = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ContentFactsCompanion.insert(
            id: id,
            contentItemId: contentItemId,
            label: label,
            value: value,
            year: year,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            sourceLocation: sourceLocation,
            examImportant: examImportant,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ContentFactsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({contentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable:
                        $$ContentFactsTableReferences._contentItemIdTable(db),
                    referencedColumn: $$ContentFactsTableReferences
                        ._contentItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ContentFactsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentFactsTable,
    ContentFactRow,
    $$ContentFactsTableFilterComposer,
    $$ContentFactsTableOrderingComposer,
    $$ContentFactsTableAnnotationComposer,
    $$ContentFactsTableCreateCompanionBuilder,
    $$ContentFactsTableUpdateCompanionBuilder,
    (ContentFactRow, $$ContentFactsTableReferences),
    ContentFactRow,
    PrefetchHooks Function({bool contentItemId})>;
typedef $$TimelineEntriesTableTableCreateCompanionBuilder
    = TimelineEntriesTableCompanion Function({
  required String id,
  required int year,
  required String title,
  required String shortInfo,
  required String detailedInfo,
  required String relatedType,
  required String contentItemId,
  Value<String> relatedPersonIdsJson,
  Value<String> relatedBookIdsJson,
  Value<String> era,
  Value<bool> examImportant,
  required String sourceType,
  Value<String?> sourceDocument,
  Value<int> rowid,
});
typedef $$TimelineEntriesTableTableUpdateCompanionBuilder
    = TimelineEntriesTableCompanion Function({
  Value<String> id,
  Value<int> year,
  Value<String> title,
  Value<String> shortInfo,
  Value<String> detailedInfo,
  Value<String> relatedType,
  Value<String> contentItemId,
  Value<String> relatedPersonIdsJson,
  Value<String> relatedBookIdsJson,
  Value<String> era,
  Value<bool> examImportant,
  Value<String> sourceType,
  Value<String?> sourceDocument,
  Value<int> rowid,
});

final class $$TimelineEntriesTableTableReferences extends BaseReferences<
    _$AppDatabase, $TimelineEntriesTableTable, TimelineEntryRow> {
  $$TimelineEntriesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems.createAlias(
          'timeline_entries_table__content_item_id__content_items__id');

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<String>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TimelineEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $TimelineEntriesTableTable> {
  $$TimelineEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortInfo => $composableBuilder(
      column: $table.shortInfo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detailedInfo => $composableBuilder(
      column: $table.detailedInfo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedType => $composableBuilder(
      column: $table.relatedType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedPersonIdsJson => $composableBuilder(
      column: $table.relatedPersonIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedBookIdsJson => $composableBuilder(
      column: $table.relatedBookIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get era => $composableBuilder(
      column: $table.era, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get examImportant => $composableBuilder(
      column: $table.examImportant, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimelineEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TimelineEntriesTableTable> {
  $$TimelineEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortInfo => $composableBuilder(
      column: $table.shortInfo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detailedInfo => $composableBuilder(
      column: $table.detailedInfo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedType => $composableBuilder(
      column: $table.relatedType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedPersonIdsJson => $composableBuilder(
      column: $table.relatedPersonIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedBookIdsJson => $composableBuilder(
      column: $table.relatedBookIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get era => $composableBuilder(
      column: $table.era, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get examImportant => $composableBuilder(
      column: $table.examImportant,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimelineEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimelineEntriesTableTable> {
  $$TimelineEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get shortInfo =>
      $composableBuilder(column: $table.shortInfo, builder: (column) => column);

  GeneratedColumn<String> get detailedInfo => $composableBuilder(
      column: $table.detailedInfo, builder: (column) => column);

  GeneratedColumn<String> get relatedType => $composableBuilder(
      column: $table.relatedType, builder: (column) => column);

  GeneratedColumn<String> get relatedPersonIdsJson => $composableBuilder(
      column: $table.relatedPersonIdsJson, builder: (column) => column);

  GeneratedColumn<String> get relatedBookIdsJson => $composableBuilder(
      column: $table.relatedBookIdsJson, builder: (column) => column);

  GeneratedColumn<String> get era =>
      $composableBuilder(column: $table.era, builder: (column) => column);

  GeneratedColumn<bool> get examImportant => $composableBuilder(
      column: $table.examImportant, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimelineEntriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TimelineEntriesTableTable,
    TimelineEntryRow,
    $$TimelineEntriesTableTableFilterComposer,
    $$TimelineEntriesTableTableOrderingComposer,
    $$TimelineEntriesTableTableAnnotationComposer,
    $$TimelineEntriesTableTableCreateCompanionBuilder,
    $$TimelineEntriesTableTableUpdateCompanionBuilder,
    (TimelineEntryRow, $$TimelineEntriesTableTableReferences),
    TimelineEntryRow,
    PrefetchHooks Function({bool contentItemId})> {
  $$TimelineEntriesTableTableTableManager(
      _$AppDatabase db, $TimelineEntriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimelineEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimelineEntriesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimelineEntriesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> shortInfo = const Value.absent(),
            Value<String> detailedInfo = const Value.absent(),
            Value<String> relatedType = const Value.absent(),
            Value<String> contentItemId = const Value.absent(),
            Value<String> relatedPersonIdsJson = const Value.absent(),
            Value<String> relatedBookIdsJson = const Value.absent(),
            Value<String> era = const Value.absent(),
            Value<bool> examImportant = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String?> sourceDocument = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TimelineEntriesTableCompanion(
            id: id,
            year: year,
            title: title,
            shortInfo: shortInfo,
            detailedInfo: detailedInfo,
            relatedType: relatedType,
            contentItemId: contentItemId,
            relatedPersonIdsJson: relatedPersonIdsJson,
            relatedBookIdsJson: relatedBookIdsJson,
            era: era,
            examImportant: examImportant,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int year,
            required String title,
            required String shortInfo,
            required String detailedInfo,
            required String relatedType,
            required String contentItemId,
            Value<String> relatedPersonIdsJson = const Value.absent(),
            Value<String> relatedBookIdsJson = const Value.absent(),
            Value<String> era = const Value.absent(),
            Value<bool> examImportant = const Value.absent(),
            required String sourceType,
            Value<String?> sourceDocument = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TimelineEntriesTableCompanion.insert(
            id: id,
            year: year,
            title: title,
            shortInfo: shortInfo,
            detailedInfo: detailedInfo,
            relatedType: relatedType,
            contentItemId: contentItemId,
            relatedPersonIdsJson: relatedPersonIdsJson,
            relatedBookIdsJson: relatedBookIdsJson,
            era: era,
            examImportant: examImportant,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TimelineEntriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({contentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable: $$TimelineEntriesTableTableReferences
                        ._contentItemIdTable(db),
                    referencedColumn: $$TimelineEntriesTableTableReferences
                        ._contentItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TimelineEntriesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TimelineEntriesTableTable,
        TimelineEntryRow,
        $$TimelineEntriesTableTableFilterComposer,
        $$TimelineEntriesTableTableOrderingComposer,
        $$TimelineEntriesTableTableAnnotationComposer,
        $$TimelineEntriesTableTableCreateCompanionBuilder,
        $$TimelineEntriesTableTableUpdateCompanionBuilder,
        (TimelineEntryRow, $$TimelineEntriesTableTableReferences),
        TimelineEntryRow,
        PrefetchHooks Function({bool contentItemId})>;
typedef $$FlashcardsTableCreateCompanionBuilder = FlashcardsCompanion Function({
  required String id,
  required String question,
  required String answer,
  required String contentItemId,
  Value<String?> factId,
  required String topicLabel,
  Value<DateTime?> lastReviewedAt,
  Value<DateTime?> nextDueAt,
  Value<int> intervalStageIndex,
  Value<int> forgetCount,
  required String sourceType,
  Value<String?> sourceDocument,
  Value<int> rowid,
});
typedef $$FlashcardsTableUpdateCompanionBuilder = FlashcardsCompanion Function({
  Value<String> id,
  Value<String> question,
  Value<String> answer,
  Value<String> contentItemId,
  Value<String?> factId,
  Value<String> topicLabel,
  Value<DateTime?> lastReviewedAt,
  Value<DateTime?> nextDueAt,
  Value<int> intervalStageIndex,
  Value<int> forgetCount,
  Value<String> sourceType,
  Value<String?> sourceDocument,
  Value<int> rowid,
});

final class $$FlashcardsTableReferences
    extends BaseReferences<_$AppDatabase, $FlashcardsTable, FlashcardRow> {
  $$FlashcardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems
          .createAlias('flashcards__content_item_id__content_items__id');

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<String>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FlashcardsTableFilterComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get factId => $composableBuilder(
      column: $table.factId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topicLabel => $composableBuilder(
      column: $table.topicLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextDueAt => $composableBuilder(
      column: $table.nextDueAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intervalStageIndex => $composableBuilder(
      column: $table.intervalStageIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get forgetCount => $composableBuilder(
      column: $table.forgetCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableOrderingComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get factId => $composableBuilder(
      column: $table.factId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topicLabel => $composableBuilder(
      column: $table.topicLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextDueAt => $composableBuilder(
      column: $table.nextDueAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intervalStageIndex => $composableBuilder(
      column: $table.intervalStageIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get forgetCount => $composableBuilder(
      column: $table.forgetCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<String> get factId =>
      $composableBuilder(column: $table.factId, builder: (column) => column);

  GeneratedColumn<String> get topicLabel => $composableBuilder(
      column: $table.topicLabel, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueAt =>
      $composableBuilder(column: $table.nextDueAt, builder: (column) => column);

  GeneratedColumn<int> get intervalStageIndex => $composableBuilder(
      column: $table.intervalStageIndex, builder: (column) => column);

  GeneratedColumn<int> get forgetCount => $composableBuilder(
      column: $table.forgetCount, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FlashcardsTable,
    FlashcardRow,
    $$FlashcardsTableFilterComposer,
    $$FlashcardsTableOrderingComposer,
    $$FlashcardsTableAnnotationComposer,
    $$FlashcardsTableCreateCompanionBuilder,
    $$FlashcardsTableUpdateCompanionBuilder,
    (FlashcardRow, $$FlashcardsTableReferences),
    FlashcardRow,
    PrefetchHooks Function({bool contentItemId})> {
  $$FlashcardsTableTableManager(_$AppDatabase db, $FlashcardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlashcardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlashcardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlashcardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> answer = const Value.absent(),
            Value<String> contentItemId = const Value.absent(),
            Value<String?> factId = const Value.absent(),
            Value<String> topicLabel = const Value.absent(),
            Value<DateTime?> lastReviewedAt = const Value.absent(),
            Value<DateTime?> nextDueAt = const Value.absent(),
            Value<int> intervalStageIndex = const Value.absent(),
            Value<int> forgetCount = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String?> sourceDocument = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FlashcardsCompanion(
            id: id,
            question: question,
            answer: answer,
            contentItemId: contentItemId,
            factId: factId,
            topicLabel: topicLabel,
            lastReviewedAt: lastReviewedAt,
            nextDueAt: nextDueAt,
            intervalStageIndex: intervalStageIndex,
            forgetCount: forgetCount,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String question,
            required String answer,
            required String contentItemId,
            Value<String?> factId = const Value.absent(),
            required String topicLabel,
            Value<DateTime?> lastReviewedAt = const Value.absent(),
            Value<DateTime?> nextDueAt = const Value.absent(),
            Value<int> intervalStageIndex = const Value.absent(),
            Value<int> forgetCount = const Value.absent(),
            required String sourceType,
            Value<String?> sourceDocument = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FlashcardsCompanion.insert(
            id: id,
            question: question,
            answer: answer,
            contentItemId: contentItemId,
            factId: factId,
            topicLabel: topicLabel,
            lastReviewedAt: lastReviewedAt,
            nextDueAt: nextDueAt,
            intervalStageIndex: intervalStageIndex,
            forgetCount: forgetCount,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FlashcardsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({contentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable:
                        $$FlashcardsTableReferences._contentItemIdTable(db),
                    referencedColumn:
                        $$FlashcardsTableReferences._contentItemIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FlashcardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FlashcardsTable,
    FlashcardRow,
    $$FlashcardsTableFilterComposer,
    $$FlashcardsTableOrderingComposer,
    $$FlashcardsTableAnnotationComposer,
    $$FlashcardsTableCreateCompanionBuilder,
    $$FlashcardsTableUpdateCompanionBuilder,
    (FlashcardRow, $$FlashcardsTableReferences),
    FlashcardRow,
    PrefetchHooks Function({bool contentItemId})>;
typedef $$McqsTableCreateCompanionBuilder = McqsCompanion Function({
  required String id,
  required String type,
  required String difficulty,
  required String question,
  required String optionsJson,
  required String correctOptionId,
  required String explanation,
  required String contentItemId,
  Value<String?> factId,
  required String topicLabel,
  required String sourceType,
  Value<String?> sourceDocument,
  Value<int> rowid,
});
typedef $$McqsTableUpdateCompanionBuilder = McqsCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> difficulty,
  Value<String> question,
  Value<String> optionsJson,
  Value<String> correctOptionId,
  Value<String> explanation,
  Value<String> contentItemId,
  Value<String?> factId,
  Value<String> topicLabel,
  Value<String> sourceType,
  Value<String?> sourceDocument,
  Value<int> rowid,
});

final class $$McqsTableReferences
    extends BaseReferences<_$AppDatabase, $McqsTable, McqRow> {
  $$McqsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems.createAlias('mcqs__content_item_id__content_items__id');

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<String>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$McqsTableFilterComposer extends Composer<_$AppDatabase, $McqsTable> {
  $$McqsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionsJson => $composableBuilder(
      column: $table.optionsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get correctOptionId => $composableBuilder(
      column: $table.correctOptionId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get factId => $composableBuilder(
      column: $table.factId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topicLabel => $composableBuilder(
      column: $table.topicLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$McqsTableOrderingComposer extends Composer<_$AppDatabase, $McqsTable> {
  $$McqsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionsJson => $composableBuilder(
      column: $table.optionsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctOptionId => $composableBuilder(
      column: $table.correctOptionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get factId => $composableBuilder(
      column: $table.factId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topicLabel => $composableBuilder(
      column: $table.topicLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument,
      builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$McqsTableAnnotationComposer
    extends Composer<_$AppDatabase, $McqsTable> {
  $$McqsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get optionsJson => $composableBuilder(
      column: $table.optionsJson, builder: (column) => column);

  GeneratedColumn<String> get correctOptionId => $composableBuilder(
      column: $table.correctOptionId, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => column);

  GeneratedColumn<String> get factId =>
      $composableBuilder(column: $table.factId, builder: (column) => column);

  GeneratedColumn<String> get topicLabel => $composableBuilder(
      column: $table.topicLabel, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceDocument => $composableBuilder(
      column: $table.sourceDocument, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$McqsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $McqsTable,
    McqRow,
    $$McqsTableFilterComposer,
    $$McqsTableOrderingComposer,
    $$McqsTableAnnotationComposer,
    $$McqsTableCreateCompanionBuilder,
    $$McqsTableUpdateCompanionBuilder,
    (McqRow, $$McqsTableReferences),
    McqRow,
    PrefetchHooks Function({bool contentItemId})> {
  $$McqsTableTableManager(_$AppDatabase db, $McqsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$McqsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$McqsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$McqsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> difficulty = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> optionsJson = const Value.absent(),
            Value<String> correctOptionId = const Value.absent(),
            Value<String> explanation = const Value.absent(),
            Value<String> contentItemId = const Value.absent(),
            Value<String?> factId = const Value.absent(),
            Value<String> topicLabel = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String?> sourceDocument = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              McqsCompanion(
            id: id,
            type: type,
            difficulty: difficulty,
            question: question,
            optionsJson: optionsJson,
            correctOptionId: correctOptionId,
            explanation: explanation,
            contentItemId: contentItemId,
            factId: factId,
            topicLabel: topicLabel,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String difficulty,
            required String question,
            required String optionsJson,
            required String correctOptionId,
            required String explanation,
            required String contentItemId,
            Value<String?> factId = const Value.absent(),
            required String topicLabel,
            required String sourceType,
            Value<String?> sourceDocument = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              McqsCompanion.insert(
            id: id,
            type: type,
            difficulty: difficulty,
            question: question,
            optionsJson: optionsJson,
            correctOptionId: correctOptionId,
            explanation: explanation,
            contentItemId: contentItemId,
            factId: factId,
            topicLabel: topicLabel,
            sourceType: sourceType,
            sourceDocument: sourceDocument,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$McqsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({contentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable:
                        $$McqsTableReferences._contentItemIdTable(db),
                    referencedColumn:
                        $$McqsTableReferences._contentItemIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$McqsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $McqsTable,
    McqRow,
    $$McqsTableFilterComposer,
    $$McqsTableOrderingComposer,
    $$McqsTableAnnotationComposer,
    $$McqsTableCreateCompanionBuilder,
    $$McqsTableUpdateCompanionBuilder,
    (McqRow, $$McqsTableReferences),
    McqRow,
    PrefetchHooks Function({bool contentItemId})>;
typedef $$TopicProgressTableCreateCompanionBuilder = TopicProgressCompanion
    Function({
  required String contentItemId,
  Value<int> correctCount,
  Value<int> wrongCount,
  Value<DateTime?> lastPracticedAt,
  Value<int> rowid,
});
typedef $$TopicProgressTableUpdateCompanionBuilder = TopicProgressCompanion
    Function({
  Value<String> contentItemId,
  Value<int> correctCount,
  Value<int> wrongCount,
  Value<DateTime?> lastPracticedAt,
  Value<int> rowid,
});

final class $$TopicProgressTableReferences extends BaseReferences<_$AppDatabase,
    $TopicProgressTable, TopicProgressRow> {
  $$TopicProgressTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ContentItemsTable _contentItemIdTable(_$AppDatabase db) =>
      db.contentItems
          .createAlias('topic_progress__content_item_id__content_items__id');

  $$ContentItemsTableProcessedTableManager get contentItemId {
    final $_column = $_itemColumn<String>('content_item_id')!;

    final manager = $$ContentItemsTableTableManager($_db, $_db.contentItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TopicProgressTableFilterComposer
    extends Composer<_$AppDatabase, $TopicProgressTable> {
  $$TopicProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wrongCount => $composableBuilder(
      column: $table.wrongCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPracticedAt => $composableBuilder(
      column: $table.lastPracticedAt,
      builder: (column) => ColumnFilters(column));

  $$ContentItemsTableFilterComposer get contentItemId {
    final $$ContentItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableFilterComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TopicProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicProgressTable> {
  $$TopicProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get correctCount => $composableBuilder(
      column: $table.correctCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wrongCount => $composableBuilder(
      column: $table.wrongCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPracticedAt => $composableBuilder(
      column: $table.lastPracticedAt,
      builder: (column) => ColumnOrderings(column));

  $$ContentItemsTableOrderingComposer get contentItemId {
    final $$ContentItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableOrderingComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TopicProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicProgressTable> {
  $$TopicProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => column);

  GeneratedColumn<int> get wrongCount => $composableBuilder(
      column: $table.wrongCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPracticedAt => $composableBuilder(
      column: $table.lastPracticedAt, builder: (column) => column);

  $$ContentItemsTableAnnotationComposer get contentItemId {
    final $$ContentItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.contentItemId,
        referencedTable: $db.contentItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ContentItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.contentItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TopicProgressTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TopicProgressTable,
    TopicProgressRow,
    $$TopicProgressTableFilterComposer,
    $$TopicProgressTableOrderingComposer,
    $$TopicProgressTableAnnotationComposer,
    $$TopicProgressTableCreateCompanionBuilder,
    $$TopicProgressTableUpdateCompanionBuilder,
    (TopicProgressRow, $$TopicProgressTableReferences),
    TopicProgressRow,
    PrefetchHooks Function({bool contentItemId})> {
  $$TopicProgressTableTableManager(_$AppDatabase db, $TopicProgressTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> contentItemId = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> wrongCount = const Value.absent(),
            Value<DateTime?> lastPracticedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TopicProgressCompanion(
            contentItemId: contentItemId,
            correctCount: correctCount,
            wrongCount: wrongCount,
            lastPracticedAt: lastPracticedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String contentItemId,
            Value<int> correctCount = const Value.absent(),
            Value<int> wrongCount = const Value.absent(),
            Value<DateTime?> lastPracticedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TopicProgressCompanion.insert(
            contentItemId: contentItemId,
            correctCount: correctCount,
            wrongCount: wrongCount,
            lastPracticedAt: lastPracticedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TopicProgressTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({contentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (contentItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.contentItemId,
                    referencedTable:
                        $$TopicProgressTableReferences._contentItemIdTable(db),
                    referencedColumn: $$TopicProgressTableReferences
                        ._contentItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TopicProgressTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TopicProgressTable,
    TopicProgressRow,
    $$TopicProgressTableFilterComposer,
    $$TopicProgressTableOrderingComposer,
    $$TopicProgressTableAnnotationComposer,
    $$TopicProgressTableCreateCompanionBuilder,
    $$TopicProgressTableUpdateCompanionBuilder,
    (TopicProgressRow, $$TopicProgressTableReferences),
    TopicProgressRow,
    PrefetchHooks Function({bool contentItemId})>;
typedef $$ExamAttemptsTableCreateCompanionBuilder = ExamAttemptsCompanion
    Function({
  required String id,
  required DateTime startedAt,
  Value<DateTime?> finishedAt,
  required int totalQuestions,
  Value<int> correct,
  Value<int> wrong,
  Value<int> skipped,
  required String questionIdsJson,
  Value<int> rowid,
});
typedef $$ExamAttemptsTableUpdateCompanionBuilder = ExamAttemptsCompanion
    Function({
  Value<String> id,
  Value<DateTime> startedAt,
  Value<DateTime?> finishedAt,
  Value<int> totalQuestions,
  Value<int> correct,
  Value<int> wrong,
  Value<int> skipped,
  Value<String> questionIdsJson,
  Value<int> rowid,
});

class $$ExamAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalQuestions => $composableBuilder(
      column: $table.totalQuestions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correct => $composableBuilder(
      column: $table.correct, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wrong => $composableBuilder(
      column: $table.wrong, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get skipped => $composableBuilder(
      column: $table.skipped, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get questionIdsJson => $composableBuilder(
      column: $table.questionIdsJson,
      builder: (column) => ColumnFilters(column));
}

class $$ExamAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
      column: $table.totalQuestions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correct => $composableBuilder(
      column: $table.correct, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wrong => $composableBuilder(
      column: $table.wrong, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get skipped => $composableBuilder(
      column: $table.skipped, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questionIdsJson => $composableBuilder(
      column: $table.questionIdsJson,
      builder: (column) => ColumnOrderings(column));
}

class $$ExamAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => column);

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
      column: $table.totalQuestions, builder: (column) => column);

  GeneratedColumn<int> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  GeneratedColumn<int> get wrong =>
      $composableBuilder(column: $table.wrong, builder: (column) => column);

  GeneratedColumn<int> get skipped =>
      $composableBuilder(column: $table.skipped, builder: (column) => column);

  GeneratedColumn<String> get questionIdsJson => $composableBuilder(
      column: $table.questionIdsJson, builder: (column) => column);
}

class $$ExamAttemptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExamAttemptsTable,
    ExamAttemptRow,
    $$ExamAttemptsTableFilterComposer,
    $$ExamAttemptsTableOrderingComposer,
    $$ExamAttemptsTableAnnotationComposer,
    $$ExamAttemptsTableCreateCompanionBuilder,
    $$ExamAttemptsTableUpdateCompanionBuilder,
    (
      ExamAttemptRow,
      BaseReferences<_$AppDatabase, $ExamAttemptsTable, ExamAttemptRow>
    ),
    ExamAttemptRow,
    PrefetchHooks Function()> {
  $$ExamAttemptsTableTableManager(_$AppDatabase db, $ExamAttemptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamAttemptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> finishedAt = const Value.absent(),
            Value<int> totalQuestions = const Value.absent(),
            Value<int> correct = const Value.absent(),
            Value<int> wrong = const Value.absent(),
            Value<int> skipped = const Value.absent(),
            Value<String> questionIdsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExamAttemptsCompanion(
            id: id,
            startedAt: startedAt,
            finishedAt: finishedAt,
            totalQuestions: totalQuestions,
            correct: correct,
            wrong: wrong,
            skipped: skipped,
            questionIdsJson: questionIdsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime startedAt,
            Value<DateTime?> finishedAt = const Value.absent(),
            required int totalQuestions,
            Value<int> correct = const Value.absent(),
            Value<int> wrong = const Value.absent(),
            Value<int> skipped = const Value.absent(),
            required String questionIdsJson,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExamAttemptsCompanion.insert(
            id: id,
            startedAt: startedAt,
            finishedAt: finishedAt,
            totalQuestions: totalQuestions,
            correct: correct,
            wrong: wrong,
            skipped: skipped,
            questionIdsJson: questionIdsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExamAttemptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExamAttemptsTable,
    ExamAttemptRow,
    $$ExamAttemptsTableFilterComposer,
    $$ExamAttemptsTableOrderingComposer,
    $$ExamAttemptsTableAnnotationComposer,
    $$ExamAttemptsTableCreateCompanionBuilder,
    $$ExamAttemptsTableUpdateCompanionBuilder,
    (
      ExamAttemptRow,
      BaseReferences<_$AppDatabase, $ExamAttemptsTable, ExamAttemptRow>
    ),
    ExamAttemptRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContentItemsTableTableManager get contentItems =>
      $$ContentItemsTableTableManager(_db, _db.contentItems);
  $$ContentSectionsTableTableManager get contentSections =>
      $$ContentSectionsTableTableManager(_db, _db.contentSections);
  $$ContentFactsTableTableManager get contentFacts =>
      $$ContentFactsTableTableManager(_db, _db.contentFacts);
  $$TimelineEntriesTableTableTableManager get timelineEntriesTable =>
      $$TimelineEntriesTableTableTableManager(_db, _db.timelineEntriesTable);
  $$FlashcardsTableTableManager get flashcards =>
      $$FlashcardsTableTableManager(_db, _db.flashcards);
  $$McqsTableTableManager get mcqs => $$McqsTableTableManager(_db, _db.mcqs);
  $$TopicProgressTableTableManager get topicProgress =>
      $$TopicProgressTableTableManager(_db, _db.topicProgress);
  $$ExamAttemptsTableTableManager get examAttempts =>
      $$ExamAttemptsTableTableManager(_db, _db.examAttempts);
}

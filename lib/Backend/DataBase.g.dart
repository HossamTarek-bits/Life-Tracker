// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataBase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Stat extends DataClass implements Insertable<Stat> {
  final int id;
  final String tag;
  final int value;
  final DateTime date;
  Stat(
      {@required this.id,
      @required this.tag,
      @required this.value,
      @required this.date});
  factory Stat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Stat(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      tag: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tag']),
      value: intType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || tag != null) {
      map['tag'] = Variable<String>(tag);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<int>(value);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  StatisticsCompanion toCompanion(bool nullToAbsent) {
    return StatisticsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      tag: tag == null && nullToAbsent ? const Value.absent() : Value(tag),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Stat(
      id: serializer.fromJson<int>(json['id']),
      tag: serializer.fromJson<String>(json['tag']),
      value: serializer.fromJson<int>(json['value']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tag': serializer.toJson<String>(tag),
      'value': serializer.toJson<int>(value),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Stat copyWith({int id, String tag, int value, DateTime date}) => Stat(
        id: id ?? this.id,
        tag: tag ?? this.tag,
        value: value ?? this.value,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Stat(')
          ..write('id: $id, ')
          ..write('tag: $tag, ')
          ..write('value: $value, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(tag.hashCode, $mrjc(value.hashCode, date.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Stat &&
          other.id == this.id &&
          other.tag == this.tag &&
          other.value == this.value &&
          other.date == this.date);
}

class StatisticsCompanion extends UpdateCompanion<Stat> {
  final Value<int> id;
  final Value<String> tag;
  final Value<int> value;
  final Value<DateTime> date;
  const StatisticsCompanion({
    this.id = const Value.absent(),
    this.tag = const Value.absent(),
    this.value = const Value.absent(),
    this.date = const Value.absent(),
  });
  StatisticsCompanion.insert({
    this.id = const Value.absent(),
    @required String tag,
    @required int value,
    @required DateTime date,
  })  : tag = Value(tag),
        value = Value(value),
        date = Value(date);
  static Insertable<Stat> custom({
    Expression<int> id,
    Expression<String> tag,
    Expression<int> value,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tag != null) 'tag': tag,
      if (value != null) 'value': value,
      if (date != null) 'date': date,
    });
  }

  StatisticsCompanion copyWith(
      {Value<int> id,
      Value<String> tag,
      Value<int> value,
      Value<DateTime> date}) {
    return StatisticsCompanion(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      value: value ?? this.value,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticsCompanion(')
          ..write('id: $id, ')
          ..write('tag: $tag, ')
          ..write('value: $value, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $StatisticsTable extends Statistics
    with TableInfo<$StatisticsTable, Stat> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatisticsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _tagMeta = const VerificationMeta('tag');
  GeneratedTextColumn _tag;
  @override
  GeneratedTextColumn get tag => _tag ??= _constructTag();
  GeneratedTextColumn _constructTag() {
    return GeneratedTextColumn(
      'tag',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedIntColumn _value;
  @override
  GeneratedIntColumn get value => _value ??= _constructValue();
  GeneratedIntColumn _constructValue() {
    return GeneratedIntColumn(
      'value',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, tag, value, date];
  @override
  $StatisticsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'statistics';
  @override
  final String actualTableName = 'statistics';
  @override
  VerificationContext validateIntegrity(Insertable<Stat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag'], _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stat map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Stat.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatisticsTable createAlias(String alias) {
    return $StatisticsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $StatisticsTable _statistics;
  $StatisticsTable get statistics => _statistics ??= $StatisticsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [statistics];
}

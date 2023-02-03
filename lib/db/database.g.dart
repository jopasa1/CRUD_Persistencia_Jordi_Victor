// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MovementsTable extends Movements
    with TableInfo<$MovementsTable, Movement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _inOutMeta = const VerificationMeta('inOut');
  @override
  late final GeneratedColumn<String> inOut = GeneratedColumn<String>(
      'in_out', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conceptMeta =
      const VerificationMeta('concept');
  @override
  late final GeneratedColumn<String> concept = GeneratedColumn<String>(
      'concept', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
      'sum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [code, user, inOut, date, category, type, concept, sum];
  @override
  String get aliasedName => _alias ?? 'movements';
  @override
  String get actualTableName => 'movements';
  @override
  VerificationContext validateIntegrity(Insertable<Movement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('in_out')) {
      context.handle(
          _inOutMeta, inOut.isAcceptableOrUnknown(data['in_out']!, _inOutMeta));
    } else if (isInserting) {
      context.missing(_inOutMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('concept')) {
      context.handle(_conceptMeta,
          concept.isAcceptableOrUnknown(data['concept']!, _conceptMeta));
    } else if (isInserting) {
      context.missing(_conceptMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Movement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movement(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user'])!,
      inOut: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}in_out'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      concept: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}concept'])!,
      sum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sum'])!,
    );
  }

  @override
  $MovementsTable createAlias(String alias) {
    return $MovementsTable(attachedDatabase, alias);
  }
}

class Movement extends DataClass implements Insertable<Movement> {
  final String code;
  final String user;
  final String inOut;
  final String date;
  final String category;
  final String type;
  final String concept;
  final int sum;
  const Movement(
      {required this.code,
      required this.user,
      required this.inOut,
      required this.date,
      required this.category,
      required this.type,
      required this.concept,
      required this.sum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['user'] = Variable<String>(user);
    map['in_out'] = Variable<String>(inOut);
    map['date'] = Variable<String>(date);
    map['category'] = Variable<String>(category);
    map['type'] = Variable<String>(type);
    map['concept'] = Variable<String>(concept);
    map['sum'] = Variable<int>(sum);
    return map;
  }

  MovementsCompanion toCompanion(bool nullToAbsent) {
    return MovementsCompanion(
      code: Value(code),
      user: Value(user),
      inOut: Value(inOut),
      date: Value(date),
      category: Value(category),
      type: Value(type),
      concept: Value(concept),
      sum: Value(sum),
    );
  }

  factory Movement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movement(
      code: serializer.fromJson<String>(json['code']),
      user: serializer.fromJson<String>(json['user']),
      inOut: serializer.fromJson<String>(json['inOut']),
      date: serializer.fromJson<String>(json['date']),
      category: serializer.fromJson<String>(json['category']),
      type: serializer.fromJson<String>(json['type']),
      concept: serializer.fromJson<String>(json['concept']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'user': serializer.toJson<String>(user),
      'inOut': serializer.toJson<String>(inOut),
      'date': serializer.toJson<String>(date),
      'category': serializer.toJson<String>(category),
      'type': serializer.toJson<String>(type),
      'concept': serializer.toJson<String>(concept),
      'sum': serializer.toJson<int>(sum),
    };
  }

  Movement copyWith(
          {String? code,
          String? user,
          String? inOut,
          String? date,
          String? category,
          String? type,
          String? concept,
          int? sum}) =>
      Movement(
        code: code ?? this.code,
        user: user ?? this.user,
        inOut: inOut ?? this.inOut,
        date: date ?? this.date,
        category: category ?? this.category,
        type: type ?? this.type,
        concept: concept ?? this.concept,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('Movement(')
          ..write('code: $code, ')
          ..write('user: $user, ')
          ..write('inOut: $inOut, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('concept: $concept, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, user, inOut, date, category, type, concept, sum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movement &&
          other.code == this.code &&
          other.user == this.user &&
          other.inOut == this.inOut &&
          other.date == this.date &&
          other.category == this.category &&
          other.type == this.type &&
          other.concept == this.concept &&
          other.sum == this.sum);
}

class MovementsCompanion extends UpdateCompanion<Movement> {
  final Value<String> code;
  final Value<String> user;
  final Value<String> inOut;
  final Value<String> date;
  final Value<String> category;
  final Value<String> type;
  final Value<String> concept;
  final Value<int> sum;
  const MovementsCompanion({
    this.code = const Value.absent(),
    this.user = const Value.absent(),
    this.inOut = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.type = const Value.absent(),
    this.concept = const Value.absent(),
    this.sum = const Value.absent(),
  });
  MovementsCompanion.insert({
    required String code,
    required String user,
    required String inOut,
    required String date,
    required String category,
    required String type,
    required String concept,
    required int sum,
  })  : code = Value(code),
        user = Value(user),
        inOut = Value(inOut),
        date = Value(date),
        category = Value(category),
        type = Value(type),
        concept = Value(concept),
        sum = Value(sum);
  static Insertable<Movement> custom({
    Expression<String>? code,
    Expression<String>? user,
    Expression<String>? inOut,
    Expression<String>? date,
    Expression<String>? category,
    Expression<String>? type,
    Expression<String>? concept,
    Expression<int>? sum,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (user != null) 'user': user,
      if (inOut != null) 'in_out': inOut,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (type != null) 'type': type,
      if (concept != null) 'concept': concept,
      if (sum != null) 'sum': sum,
    });
  }

  MovementsCompanion copyWith(
      {Value<String>? code,
      Value<String>? user,
      Value<String>? inOut,
      Value<String>? date,
      Value<String>? category,
      Value<String>? type,
      Value<String>? concept,
      Value<int>? sum}) {
    return MovementsCompanion(
      code: code ?? this.code,
      user: user ?? this.user,
      inOut: inOut ?? this.inOut,
      date: date ?? this.date,
      category: category ?? this.category,
      type: type ?? this.type,
      concept: concept ?? this.concept,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (inOut.present) {
      map['in_out'] = Variable<String>(inOut.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (concept.present) {
      map['concept'] = Variable<String>(concept.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovementsCompanion(')
          ..write('code: $code, ')
          ..write('user: $user, ')
          ..write('inOut: $inOut, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('concept: $concept, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dniMeta = const VerificationMeta('dni');
  @override
  late final GeneratedColumn<String> dni = GeneratedColumn<String>(
      'dni', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _surnameMeta =
      const VerificationMeta('surname');
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
      'surname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [dni, name, surname];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dni')) {
      context.handle(
          _dniMeta, dni.isAcceptableOrUnknown(data['dni']!, _dniMeta));
    } else if (isInserting) {
      context.missing(_dniMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta));
    } else if (isInserting) {
      context.missing(_surnameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dni};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      dni: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dni'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      surname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surname'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String dni;
  final String name;
  final String surname;
  const User({required this.dni, required this.name, required this.surname});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dni'] = Variable<String>(dni);
    map['name'] = Variable<String>(name);
    map['surname'] = Variable<String>(surname);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      dni: Value(dni),
      name: Value(name),
      surname: Value(surname),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      dni: serializer.fromJson<String>(json['dni']),
      name: serializer.fromJson<String>(json['name']),
      surname: serializer.fromJson<String>(json['surname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dni': serializer.toJson<String>(dni),
      'name': serializer.toJson<String>(name),
      'surname': serializer.toJson<String>(surname),
    };
  }

  User copyWith({String? dni, String? name, String? surname}) => User(
        dni: dni ?? this.dni,
        name: name ?? this.name,
        surname: surname ?? this.surname,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('dni: $dni, ')
          ..write('name: $name, ')
          ..write('surname: $surname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dni, name, surname);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.dni == this.dni &&
          other.name == this.name &&
          other.surname == this.surname);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> dni;
  final Value<String> name;
  final Value<String> surname;
  const UsersCompanion({
    this.dni = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
  });
  UsersCompanion.insert({
    required String dni,
    required String name,
    required String surname,
  })  : dni = Value(dni),
        name = Value(name),
        surname = Value(surname);
  static Insertable<User> custom({
    Expression<String>? dni,
    Expression<String>? name,
    Expression<String>? surname,
  }) {
    return RawValuesInsertable({
      if (dni != null) 'dni': dni,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? dni, Value<String>? name, Value<String>? surname}) {
    return UsersCompanion(
      dni: dni ?? this.dni,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dni.present) {
      map['dni'] = Variable<String>(dni.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('dni: $dni, ')
          ..write('name: $name, ')
          ..write('surname: $surname')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $MovementsTable movements = $MovementsTable(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movements, users];
}

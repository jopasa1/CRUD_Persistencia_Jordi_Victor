
import 'package:drift/drift.dart';

class Movements extends Table {

  TextColumn get code => text()();
  TextColumn get user => text()();
  TextColumn get inOut => text()();
  TextColumn get date => text()();
  TextColumn get category => text()();
  TextColumn get type => text()();
  TextColumn get concept => text()();
  IntColumn get sum => integer()();

  @override
  Set<Column> get primaryKey => {code};

}

class Users extends Table{

  TextColumn get dni => text()();
  TextColumn get name => text()();
  TextColumn get surname => text()();

  @override
  Set<Column> get primaryKey => {dni};
}

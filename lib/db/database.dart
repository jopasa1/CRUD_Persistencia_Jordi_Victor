import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'tables.dart';

part 'database.g.dart';


//Generamos la conexion con la base de datos extrayendo el path al archivo mediante el package path.
LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path,'account.sqlite'));

    return NativeDatabase(file);
  });
}

//Declaramos la creacion de la base de datos partiendo de la tabla Events declarada en tables.dart.
@DriftDatabase(tables: [Movements,Users])
class AppDb extends _$AppDb{
  //Llamamos al metodo padre.
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;



  //MOVEMENTS

  Future<List<Movement>> getMovements() async{
    return await select(movements).get();
  }

  Future<Movement> getMovement(String user) async{
    return await (select(movements)..where((tbl) => tbl.user.equals(user))).getSingle();
  }

  Future<int> insertMovement(MovementsCompanion entity) async{
    return await into(movements).insert(entity);
  }

  Future<bool> updateMovement(MovementsCompanion entity) async{
    return await update(movements).replace(entity);
  }
  
  Future<int> deleteMovement(String user) async{
    return await (delete(movements)..where((tbl) => tbl.user.equals(user))).go();
  }



  //USERS

  Future<List<User>> getUsers() async{
    return await select(users).get();
  }

  Future<User> getUser(String dni) async{
    return await (select(users)..where((tbl) => tbl.dni.equals(dni))).getSingle();
  }

  Future<int> insertUser(UsersCompanion entity) async{
    return await into(users).insert(entity);
  }

  Future<bool> updateUser(UsersCompanion entity) async{
    return await update(users).replace(entity);
  }

  Future<int> deleteUser(String dni) async{
    return await (delete(users)..where((tbl) => tbl.dni.equals(dni))).go();
  }


}
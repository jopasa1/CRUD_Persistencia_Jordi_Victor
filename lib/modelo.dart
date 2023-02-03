
import 'package:crud_framework/db/database.dart';
import 'package:drift/drift.dart';

import 'CRUD_base/CRUD_model_base.dart';
import 'models/bank_model.dart';


class Modelo {
  static final Modelo _modelo = Modelo._internal();

  factory Modelo() {
    return _modelo;
  }

  Modelo._internal();

  final CRUD_Transaction crudTransaction = CRUD_Transaction();
  final CRUD_User crudUser = CRUD_User();
  late AppDb _db;

  Future<void> loadData() async{
    try{
      _db = AppDb();
      List<User> users = await _db.getUsers();
      for(var user in users){
        crudUser.addItem(AppUser(user.dni, user.name, user.surname));
      }
      List<Movement> transactions = await _db.getMovements();
      for(var transaction in transactions){
        //Transaction(super.key,this.inOut,this.dni, this.date, this.category, this.type, this.concept, this.sum);
        crudTransaction.addItem(Transaction(transaction.code,transaction.inOut,transaction.user,transaction.date,transaction.category,transaction.type,transaction.concept,transaction.sum));
      }

    }catch(e){
      print(e);
    }
  }

  void add<T>(T item) {
    switch (T) {
      case Transaction:{
        crudTransaction.addItem(item as Transaction);
        try{
          final entity = MovementsCompanion(
            code: Value(item.key),
            inOut: Value(item.inOut),
            user: Value(item.dni),
            date: Value(item.date),
            category: Value(item.category),
            type: Value(item.type),
            concept: Value(item.concept),
            sum: Value(item.sum),
          );
          _db.insertMovement(entity);
        }catch(e){
          print(e);
        }

      }break;
      case AppUser:{
        crudUser.addItem(item as AppUser);
        try{
          final entity = UsersCompanion(
              dni: Value(item.key),
              name: Value(item.name),
            surname: Value(item.surname),
          );
          _db.insertUser(entity);
        }catch(e){
          print(e);
        }
      }break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  void delete<T>(T item) {
    switch (T) {
      case Transaction:{
        crudTransaction.deleteItem(item as Transaction);
      }break;
      case AppUser:{
        crudUser.deleteItem(item as AppUser);
        try{
          _db.deleteUser(item.key);
        }catch(e){
          print(e);
        }
      }break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  void updateItem<T>(T originalItem, T updatedItem) {
    switch (T) {
      case Transaction:{
        crudTransaction.updateItem(updatedItem as Transaction);
      }break;
      case AppUser:{
        crudUser.updateItem(updatedItem as AppUser);
        try{
          final entity = UsersCompanion(
            dni: Value(updatedItem.key),
            name: Value(updatedItem.name),
            surname: Value(updatedItem.surname),
          );
          _db.updateUser(entity);
        }catch(e){
          print(e);
        }
      }break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  List<T> getAll<T>() {
    switch (T) {
      case Transaction:{
        List<Transaction> transactions = [];
        Map<String, Transaction> _datos = crudTransaction.datos;

        _datos.forEach((k, value) {transactions.add(value);});

        return transactions.cast();
      }
      case AppUser:{
        List<AppUser> users =[];
        Map<String, AppUser> _datos = crudUser.datos;

        _datos.forEach((key, value) {users.add(value);});

        return users.cast();
      }break;
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }

  T? get<T extends Item>(dynamic codigo) {
    switch (T) {
      default:
        throw UnimplementedError("Type ${T.toString()} not supported.");
    }
  }
}

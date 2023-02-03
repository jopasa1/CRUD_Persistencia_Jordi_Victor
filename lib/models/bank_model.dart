import 'package:crud_framework/CRUD_base/CRUD_model_base.dart';
import 'package:crud_framework/CRUD_base/CRUD_view_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


//MOVEMENTS/TRANSACTIONS
class Transaction extends Item<String>{

  final String inOut;
  final String dni;
  final String date;
  final String category;
  final String type;
  final String concept;
  final int sum;

  Transaction(super.key,this.inOut,this.dni, this.date, this.category, this.type, this.concept, this.sum);

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    Map<String,dynamic> trasnsactionMap={
      'key':super.key,
      'inOut':this.inOut,
      'dni':this.dni,
      'date':this.date,
      'category':this.category,
      'type':this.type,
      'concept':this.concept,
      'sum':this.sum,
    };
    return trasnsactionMap;
    //throw UnimplementedError();
  }

}

//SABEMOS QUE NO TENEMOS QUE IMPLEMENTARLA!!!
class CRUD_Transaction implements CRUDModelBase<String,Transaction>{

  final Map<String,Transaction> _datos ={};

  @override
  void addItem(transaction) {
    // TODO: implement addItem
    String key=transaction.key;
    if (_datos.containsKey(key)) {
      updateItem(transaction);
      // throw ArgumentError("Ja existeix un item amb la clau $key");
    }else{
      _datos[key]=transaction;
    }
  }

  @override
  // TODO: implement datos
  Map<String,Transaction> get datos => _datos;

  @override
  void updateItem(transaction) {
    // TODO: implement updateItem
    String key=transaction.key;
    if (_datos.containsKey(key)) {
      _datos[key]=transaction;
    } else {
      throw ArgumentError("No existeix cap item amb la clau $key");
    }

  }
  
  void deleteItem(transaction){
    String key=transaction.key;
    if (_datos.containsKey(key)) {
      _datos.remove(key);
    } else {
      throw ArgumentError("No existeix cap item amb la clau $key");
    }
  }
}



//USERS
class AppUser extends Item<String>{

  final String name;
  final String surname;

  AppUser(super.key, this.name, this.surname);

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    Map<String,dynamic> userMap={
      'key':super.key,
      'name':this.name,
      'surname':this.surname,
    };
    return userMap;
    //throw UnimplementedError();
  }
}
class CRUD_User implements CRUDModelBase<String,AppUser>{

  final Map<String,AppUser> _datos ={};

  @override
  void addItem(user) {
    // TODO: implement addItem
    String key=user.key;
    if (_datos.containsKey(key)) {
      updateItem(user);
      // throw ArgumentError("Ja existeix un item amb la clau $key");
    }else{
      _datos[key]=user;
    }
  }

  @override
  // TODO: implement datos
  Map<String,AppUser> get datos => _datos;

  @override
  void updateItem(user) {
    // TODO: implement updateItem
    String key=user.key;
    if (_datos.containsKey(key)) {
      _datos[key]=user;
    } else {
      throw ArgumentError("No existeix cap item amb la clau $key");
    }
  }

  void deleteItem(user){
    String key=user.key;
    if (_datos.containsKey(key)) {
      _datos.remove(key);
    } else {
      throw ArgumentError("No existeix cap item amb la clau $key");
    }
  }
}


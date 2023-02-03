import 'package:flutter/material.dart';

import '../CRUD_base/CRUD_view_base.dart';
import '../models/bank_model.dart';

Widget createCards(item) {
  if (item is Transaction) {
    return Card(
        child: Container(
      color: (item.inOut == "EXPENSE") ? Colors.orange : Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
                "ID:${item.key} - USER: ${item.dni}\n${item.inOut} / ${item.type} / ${item.category} / ${item.concept} / ${item.date} / ${item.sum}€"),
          )
        ],
      ),
    ));
  } else if (item is AppUser) {
    return Card(
      child: Container(
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                    "DNI:${item.key} \n${item.name} ${item.surname}")),
          ],
        ),
      ),
    );
  }
  return Card();
}

Widget detailDialog(item) {
  if (item is Transaction) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              "ID: ${(item.key).toString()}\n"
              "MOVEMENT: ${item.inOut} \n"
              "DATE: ${item.date} \n"
              "CATEGORY: ${item.category} \n"
              "TYPE: ${item.type}\n"
              "CONCEPT: ${item.concept} \n"
              "TOTAL AMOUNT: ${(item.sum).toString()}",
              style: TextStyle(fontSize: 20, height: 2)),
        ],
      ),
    );
  }
  else if(item is AppUser){
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              "DNI: ${(item.key).toString()}\n"
                  "NAME: ${item.name}\n"
                  "SURNAME: ${item.surname}",
              style: TextStyle(fontSize: 20, height: 2)),
        ],
      ),
    );
  }
  return Dialog();
}

/////////////////////
class CRUD_View_Transaction extends CRUDFormulari<Transaction> {
  CRUD_View_Transaction({super.key, this.oTransaction});
  final Transaction? oTransaction;

  String _key = "";
  String _inOut = "";
  String _dni = "";
  String _date = "";
  String _category = "";
  String _concept = "";
  String _type = "";
  int _sum = 0;

  @override
  State<StatefulWidget> createState() => _CRUD_View_Transaction_State();

  @override
  Transaction getItem() {
    return Transaction(_key, _inOut, _dni, _date, _category, _type, _concept, _sum);
    // TODO: implement getItem
    throw UnimplementedError();
  }
}

class _CRUD_View_Transaction_State extends State<CRUD_View_Transaction> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TRANSACTION CODE:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._key = value!;
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.key,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some TRANSACTION CODE';
                }
                return null;
              },
            ),
            Text(
              "USER DNI:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._dni = value!;
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.dni,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some DNI';
                }
                return null;
              },
            ),

            Text(
              "DATE:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._date = value!;
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.date,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some DATE';
                }
                return null;
              },
            ),
            Text(
              "CATEGORY:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._category = value!;
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.category,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some CATEGORY';
                }
                return null;
              },
            ),
            Text(
              "CONCEPT:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._concept = value!;
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.concept,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Text(
              "TYPE:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._type = value!;
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.type,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some TYPE';
                }
                return null;
              },
            ),
            Text(
              "TOTAL AMOUNT:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._sum = int.parse(value!);
                if (widget._sum! < 0) {
                  widget._inOut = "EXPENSE";
                } else {
                  widget._inOut = "INCOME";
                }
              },
              initialValue: (widget.oTransaction == null)
                  ? ""
                  : widget.oTransaction!.sum.toString(),
              // The validator receives the text that the user has entered.
              validator: (value) {
                //INTENTO DE VALIDAR SI ES UN NUMERO CON PRISA...
                if (value == null ||
                    value.isEmpty ||
                    (int.parse(value!) == null)) {
                  return 'Please enter12some AMOUNT';
                }
                return null;
              },
            ),
          ],
        )
      ],
    );
    throw UnimplementedError();
  }
}

class CRUD_View_User extends CRUDFormulari<AppUser> {
  CRUD_View_User({super.key, this.oUser});
  final AppUser? oUser;

  String _key = "";
  String _name = "";
  String _surname = "";

  @override
  State<StatefulWidget> createState() => _CRUD_View_User_State();

  @override
  AppUser getItem() {
    return AppUser(_key, _name, _surname);
    // TODO: implement getItem
    throw UnimplementedError();
  }
}

class _CRUD_View_User_State extends State<CRUD_View_User> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DNI:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._key = value!;
              },
              initialValue: (widget.oUser == null) ? "" : widget.oUser!.key,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some DNI';
                }
                return null;
              },
            ),
            Text(
              "NAME:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._name = value!;
              },
              initialValue: (widget.oUser == null) ? "" : widget.oUser!.name,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some SURNAME';
                }
                return null;
              },
            ),
            Text(
              "SURNAME:",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              onSaved: (String? value) {
                widget._surname = value!;
              },
              initialValue: (widget.oUser == null) ? "" : widget.oUser!.surname,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some SURNAME';
                }
                return null;
              },
            ),
          ],
        )
      ],
    );
    throw UnimplementedError();
  }
}

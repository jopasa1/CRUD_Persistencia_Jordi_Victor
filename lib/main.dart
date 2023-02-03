import 'package:crud_framework/CRUD_base/CRUD_view_base.dart';
import 'package:crud_framework/models/bank_model.dart';
import 'package:crud_framework/widgets_lib/app_base.dart';
import 'package:crud_framework/widgets_lib/widgets.dart';
import 'package:flutter/material.dart';

import 'CRUD_base/CRUD_list_base.dart';
import 'modelo.dart';

void main() async{
  runApp(const MyApp());
  await Modelo().loadData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '- SAVINGS ACCOUNT -',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/transaction_list': (context) => CRUDListBase<Transaction>(
            itemBuilder: createCards,
            addItemRoute: '/transaction_add',
            viewItemRoute: '/transaction_view'),
        '/transaction_add': (context) => CRUDViewBase<Transaction>(
              detailedView: detailDialog,
              editFormView: CRUD_View_Transaction(),
            ),
        '/user_list': (context) => CRUDListBase<AppUser>(
            itemBuilder: createCards,
            addItemRoute: '/user_add',
            viewItemRoute: '/user_view'),
        '/user_add': (context) => CRUDViewBase<AppUser>(
            detailedView: detailDialog, editFormView: CRUD_View_User()),
      },
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case '/transaction_view':
            {
              return MaterialPageRoute(
                  builder: (context) => CRUDViewBase<Transaction>(
                        item: routeSettings.arguments as Transaction,
                        detailedView: detailDialog,
                        editFormView: CRUD_View_Transaction(
                          oTransaction: routeSettings.arguments as Transaction,
                        ),
                      ));
            }
          case '/user_view':
            {
              return MaterialPageRoute(
                  builder: (context) => CRUDViewBase<AppUser>(
                        item: routeSettings.arguments as AppUser,
                        detailedView: detailDialog,
                        editFormView: CRUD_View_User(
                          oUser: routeSettings.arguments as AppUser,
                        ),
                      ));
            }
        }
        return null;
      },
      home: const MyHomePage(title: 'CRUD Template'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseApp(
        body: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage('lib/assets/logo.png'),),
              Text("-SAVINGS ACCOUNT-",style: TextStyle(fontSize: 30,decoration: TextDecoration.underline)),
              Padding(padding: EdgeInsets.only(bottom: 10,top: 290),
              child: Text("Jordi Pascual - Victor Duart (IES El Calamot)"),)
            ],
          ),
        ));
  }
}

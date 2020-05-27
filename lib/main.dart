import 'package:flutter/material.dart';
import 'package:samsungstore/pages/admin.dart';
import 'package:samsungstore/pages/home.dart';
import './pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    routes: <String,WidgetBuilder>{
      '/pages/home': (BuildContext context)=> new HomePage(),
      '/pages/admin': (BuildContext context)=> new AdminPage(),
      '/pages/login': (BuildContext context)=> new Login(),
    },
  ));
}


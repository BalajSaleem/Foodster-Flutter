import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green[300],
        accentColor:  Colors.grey[600],
        backgroundColor: Colors.grey[800],
        fontFamily: 'TenorSans',
      ),
      initialRoute: '/login',
      routes:{
        '/login' : (context) => Login(),
        '/register' : (context) => SignUp(),
        '/home' : (context) => Home(),
      }
  )
  );
}
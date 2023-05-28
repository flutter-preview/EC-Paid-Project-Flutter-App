import 'package:flutter/material.dart';
import 'dart:ui';
import 'pages/login/login.dart';
import 'pages/productGrid/product_grid.dart';
import 'pages/signpage/signup.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/gridpage": (context) => GridPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Ecommerce App",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
            backgroundColor: Colors.yellow[600],
          ),
          body: const Center(
            child: Text("Flutter Ecommerce App"),
          ),
        ));
  }
}

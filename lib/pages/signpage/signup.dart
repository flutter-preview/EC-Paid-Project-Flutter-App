import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/signup.dart';
import '../searchBar/searchbar.dart';
import 'components/my_input_column.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final SignupUser user = SignupUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
          Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 9, 126, 181), Colors.white],
              stops: [0.8, 20],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              // SearchBar()
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1637079421287-2336e69d3257?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 2,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 40.0,
                            offset: Offset(0, 10),
                            color: Color.fromARGB(8, 247, 240, 240),
                          )
                        ],
                        color: Colors.white.withOpacity(0.0),
                      ),
                      child: MyInputColumn(user: user),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      print(user.username);
                    },
                    child: const Text('Signup'),
                    style: ElevatedButton.styleFrom(
                      elevation: 9.9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.golf_course),
                    ),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.apple),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Already signed up yet? login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

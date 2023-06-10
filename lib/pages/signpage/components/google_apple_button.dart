import 'package:flutter/material.dart';

class GoogleAndAppleButtonSignup extends StatelessWidget {
  const GoogleAndAppleButtonSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
                  );
  }
}
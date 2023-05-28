import 'package:flutter/material.dart';

class MyInputBox extends StatelessWidget {
  const MyInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
                          children: <Widget>[
                            SizedBox(height: 30,),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            SizedBox(height: 40),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 50),
                           
                          ],
                        );
  }
}
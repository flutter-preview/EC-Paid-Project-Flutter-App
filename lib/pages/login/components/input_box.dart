import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../platfromSettings/input.dart';

class MyInputBox extends StatefulWidget {
  const MyInputBox({Key? key}) : super(key: key);

  @override
  _MyInputBoxState createState() => _MyInputBoxState();
}

class _MyInputBoxState extends State<MyInputBox> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        PlatformTextField(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email),
        ),
        SizedBox(height: 40),
        PlatformTextField(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          obscureText: !_isPasswordVisible,
        ),
        SizedBox(height: 50),
      ],
    );
  }
}

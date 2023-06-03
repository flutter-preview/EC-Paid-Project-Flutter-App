import 'package:flutter/material.dart';

import '../../../models/signup.dart';
import 'custom_textfield.dart';

class MyInputColumn extends StatefulWidget {
  final SignupUser user;

  const MyInputColumn({required this.user});

  @override
  State<MyInputColumn> createState() => _MyInputColumnState();
}

class _MyInputColumnState extends State<MyInputColumn> {
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
        CustomTextField(
          user: widget.user,
          type: 'username',
          label: 'Username',
          placeholder: 'Enter your username',
          myIcon: Icon(Icons.person),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: widget.user,
          type: 'email',
          label: 'Email',
          placeholder: 'Enter your email',
          myIcon: Icon(Icons.email),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: widget.user,
          type: 'password',
          label: 'Password',
          placeholder: 'Enter your password',
        obscureText: !_isPasswordVisible,
          myIcon: Icon(Icons.password),
           suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
        ),),
        const SizedBox(height: 10),
        CustomTextField(
          user: widget.user,
          type: 'confirmPassword',
          label: 'Confirm Password',
          myIcon: Icon(Icons.password),
          placeholder: 'Confirm your password',
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          // !_isPasswordVisible,
        ),
        obscureText: !_isPasswordVisible,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: widget.user,
          type: 'address',
          myIcon: Icon(Icons.location_city),
          label: 'address',
          placeholder: 'address',

        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: widget.user,
          type: 'phone',
          myIcon: Icon(Icons.phone),
          label: 'phone',
          placeholder: 'phone',

        ),
      ],
    );
  }
}

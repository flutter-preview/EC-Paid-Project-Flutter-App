import 'package:flutter/material.dart';

import '../../../models/signup.dart';
import 'custom_textfield.dart';

class MyInputColumn extends StatelessWidget {
  final SignupUser user;

  const MyInputColumn({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextField(
          user: user,
          type: 'username',
          label: 'Username',
          placeholder: 'Enter your username',
          myIcon: Icon(Icons.person),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: user,
          type: 'email',
          label: 'Email',
          placeholder: 'Enter your email',
          myIcon: Icon(Icons.email),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: user,
          type: 'password',
          label: 'Password',
          placeholder: 'Enter your password',
          myIcon: Icon(Icons.password),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: user,
          type: 'confirmPassword',
          label: 'Confirm Password',
          myIcon: Icon(Icons.password),
          placeholder: 'Confirm your password',
        ),
        const SizedBox(height: 10),
        CustomTextField(
          user: user,
          type: 'address',
          myIcon: Icon(Icons.location_city),
          label: 'address',
          placeholder: 'address',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

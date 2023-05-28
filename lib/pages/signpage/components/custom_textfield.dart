import 'package:flutter/material.dart';

import '../../../models/signup.dart';
import '../actions/actions.dart';



class CustomTextField extends StatelessWidget {
  final String type;
  final SignupUser user;
  final String label;
  final String placeholder;
  final Icon myIcon ;

  const CustomTextField({
    required this.type,
    required this.label,
    required this.placeholder,
    required this.user,
    required this.myIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: (myIcon),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          hintText: placeholder,
        ),
        onChanged: (value) {
  final onChangedFunction = getOnChangedFunction(type, user);
  if (onChangedFunction != null) {
    onChangedFunction(value);
  }
},
      ),
    );
  }
}

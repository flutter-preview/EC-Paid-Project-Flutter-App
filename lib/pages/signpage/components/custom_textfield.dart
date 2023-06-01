import 'package:flutter/material.dart';

import '../../../models/signup.dart';
import '../../../platfromSettings/input.dart';
import '../actions/actions.dart';



class CustomTextField extends StatelessWidget {
  final String type;
  final SignupUser user;
  final String label;
  final String placeholder;
  final Icon myIcon ;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomTextField({
    required this.type,
    required this.label,
    required this.placeholder,
    required this.user,
    required this.myIcon,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 300,
      child: PlatformTextField(
        labelText: label,
        prefixIcon: myIcon,

         onChanged:  (value) {
  final onChangedFunction = getOnChangedFunction(type, user);
  if (onChangedFunction != null) {
    onChangedFunction(value);
  }},
  suffixIcon: suffixIcon,
        obscureText:obscureText??false,
        // decoration: InputDecoration(
        //   labelText: label,
        //   prefixIcon: (myIcon),
          // border: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        );
  }
}

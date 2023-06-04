import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class PlatformTextField extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const PlatformTextField({
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType=TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoTextField(
        placeholder: labelText,
        prefix: prefixIcon,
        suffix: suffixIcon,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        
decoration: BoxDecoration(color: Colors.transparent),
      );
    } else {
      return TextField(

        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

        ),
        obscureText: obscureText,
        onChanged: onChanged,
         keyboardType: keyboardType,
      );
    }
  }
}
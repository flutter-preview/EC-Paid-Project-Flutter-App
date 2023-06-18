import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyTheme {
  static ThemeData appThemeData = ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(151, 82, 199, 253),
        shadowColor: Color.fromARGB(155, 0, 0, 0)),
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromARGB(148, 3, 168, 244).withOpacity(0.3),
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.lightBlue,
          width: 2.0,
        ),
      ),
    ),
  );

  static CupertinoThemeData iosThemeData = CupertinoThemeData(
    scaffoldBackgroundColor: Colors.white,
    barBackgroundColor: Color.fromARGB(175, 97, 203, 253),
    primaryColor: Color.fromARGB(146, 217, 243, 255),
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(color: Colors.lightBlue, fontFamily: 'Nunito'),
    ),
  );
}

import 'package:flutter/material.dart';

import '../const.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    dividerTheme: dividerThemeData(),
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

DividerThemeData dividerThemeData() {
  return DividerThemeData(
    space: 65,
    thickness: 0.5,
    color: Colors.grey[400],
    indent: 100,
    endIndent: 100,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Color(0XFF8B8B8B)),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Color.fromRGBO(108, 99, 255, 1),),
      gapPadding: 10,
    ),
    
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kColorTexto),
    bodyText2: TextStyle(color: kColorTexto),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.grey),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

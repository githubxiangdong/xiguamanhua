import 'package:flutter/material.dart';

class XGAppTheme {
  /// 共有属性
  static const double FontSize12 = 12;
  static const double FontSize14 = 14;
  static const double FontSize16 = 16;
  static const double FontSize18 = 18;
  static const double FontSize20 = 20;
  static const double FontSize22 = 22;
  
  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.orange,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: FontSize12, color: Color.fromRGBO(140, 140, 140, 1)),
      bodyText2: TextStyle(fontSize: FontSize12, color: Color.fromRGBO(110, 110, 110, 1)),
      subtitle1: TextStyle(fontSize: FontSize14, color: Color.fromRGBO(80, 80, 80, 1)),
      subtitle2: TextStyle(fontSize: FontSize16, color: Color.fromRGBO(10, 10, 10, 1)),
      headline1: TextStyle(fontSize: FontSize18, color: Colors.white, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: FontSize20, color: Colors.white),
      headline3: TextStyle(fontSize: FontSize22, color: Colors.white),
    ),
  );
}
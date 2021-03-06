import 'package:flutter/material.dart';

class XGAppTheme {
  /// 占位图
  static const String placeholder = 'assets/images/other/xg_placeholder_img.png';

  /// 颜色
  /// normalColor
  static const Color normalColor = Color.fromRGBO(16, 20, 30, 1);
  /// BarColor
  static const Color tabBarColor = Color.fromRGBO(35, 38, 47, 1);
  static const Color navigationBarColor = Color.fromRGBO(35, 38, 47, 1);
  static const Color searchBarColor = Color.fromRGBO(15, 20, 30, 1);
  /// textColor
  static const Color bodyText1Color = Color.fromRGBO(190, 190, 190, 1);
  static const Color bodyText2Color = Color.fromRGBO(210, 210, 210, 1);
  static const Color subtitle1Color = Color.fromRGBO(210, 210, 210, 1);
  static const Color subtitle2Color = Color.fromRGBO(220, 220, 220, 1);
  /// 分割线color
  static const Color splitLineColor = Color.fromRGBO(150, 150, 150, 1);
  /// 其他color
  static const Color white_240_Color = Color.fromRGBO(240, 240, 240, 1);

  /// 字体
  /// 共有属性
  static const double FontSize10 = 10;
  static const double FontSize12 = 12;
  static const double FontSize14 = 14;
  static const double FontSize16 = 16;
  static const double FontSize18 = 18;
  static const double FontSize20 = 20;
  static const double FontSize22 = 22;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.orange, // 主题颜色  primaryColor and accentColor
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: normalColor,

    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: FontSize10, color: bodyText1Color, fontWeight: FontWeight.normal),
      bodyText2: TextStyle(fontSize: FontSize12, color: bodyText2Color),
      subtitle1: TextStyle(fontSize: FontSize14, color: subtitle1Color),
      subtitle2: TextStyle(fontSize: FontSize16, color: subtitle2Color),
      headline1: TextStyle(fontSize: FontSize18, color: Colors.white, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: FontSize20, color: Colors.white),
      headline3: TextStyle(fontSize: FontSize22, color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: FontSize18, color: Colors.white),
      ),
    ),
  );
}

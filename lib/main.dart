import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/main/page/xg_main_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent
      ),
      home: XGMainPage(),
    );
  }
}
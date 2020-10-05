import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/recommend/page/xg_recommend_page.dart';

class XGHomePage extends StatefulWidget {
  static const String routeName = '/XGHomePage';
  @override
  _XGHomePageState createState() => _XGHomePageState();
}

class _XGHomePageState extends State<XGHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: XGRecommendPage(),
      ),
    );
  }
}

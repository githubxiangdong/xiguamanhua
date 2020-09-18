import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/home/page/xg_home_content_page.dart';

class XGHomePage extends StatelessWidget {
  static const String routeName = '/XGHomePage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('看漫画', style: Theme.of(context).textTheme.headline1),
      ),
      body: XGHomeContentPage(),
    );
  }
}

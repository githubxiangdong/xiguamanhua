import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';

class XGShuJiaPage extends StatelessWidget {
  static const String routeName = '/XGShuJiaPage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: Text('书架', style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(
        child: Text('书架'),
      ),
    );
  }
}

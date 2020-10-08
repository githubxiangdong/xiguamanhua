import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';

class XGSettingPage extends StatelessWidget {
  static const String routeName = '/XGSettingPage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: Text('设置', style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(
        child: Text('设置'),
      ),
    );
  }
}
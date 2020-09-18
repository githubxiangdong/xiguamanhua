import 'package:flutter/material.dart';

class XGSettingPage extends StatelessWidget {
  static const String routeName = '/XGSettingPage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置', style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(
        child: Text('设置'),
      ),
    );
  }
}
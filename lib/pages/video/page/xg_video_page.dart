import 'package:flutter/material.dart';

class XGVideoPage extends StatelessWidget {
  static const String routeName = '/XGVideoPage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('看动漫', style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(
        child: Text('视频'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class XGShuJiaPage extends StatelessWidget {
  static const String routeName = '/XGShuJiaPage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书架', style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(
        child: Text('书架'),
      ),
    );
  }
}

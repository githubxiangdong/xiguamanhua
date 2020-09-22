import 'package:flutter/material.dart';

class XGDetailPage extends StatefulWidget {
  static const String routeName = '/XGDetailPage';

  @override
  _XGDetailPageState createState() => _XGDetailPageState();
}

class _XGDetailPageState extends State<XGDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Container(
        child: Text('详情页'),
      ),
    );
  }
}

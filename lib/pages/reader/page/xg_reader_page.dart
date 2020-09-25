import 'package:flutter/material.dart';

class XGReaderPage extends StatefulWidget {
	static const String routeName = '/XGReaderPage';
	final comicsId;
	final chapterId;
	XGReaderPage(this.comicsId, this.chapterId);
	
  @override
  _XGReaderPageState createState() => _XGReaderPageState();
}

class _XGReaderPageState extends State<XGReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.comicsId}+${widget.chapterId}'),
      ),
    );
  }
}

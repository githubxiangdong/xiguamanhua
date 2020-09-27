import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/reader/model/xg_reader_model.dart';
import 'package:xiguamanhua/pages/reader/request/xg_reader_request.dart';

class XGReaderPage extends StatefulWidget {
	static const String routeName = '/XGReaderPage';
	final comicsId;
	final chapterId;
	final comicsTitle;
	XGReaderPage(this.comicsId, this.chapterId, this.comicsTitle);
	
  @override
  _XGReaderPageState createState() => _XGReaderPageState();
}

class _XGReaderPageState extends State<XGReaderPage> {
  XGReaderModel _readerModel;

  @override
  void initState() {
    super.initState();
    XGReaderRequest.requestReaderList(widget.comicsId, widget.chapterId).then((rsp) {
      setState(() {
        _readerModel = rsp;
      });
      print('zxd-log: ${_readerModel.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.comicsTitle == null ? '我是漫画' : widget.comicsTitle),
      ),
      body: _buildReaderItem(),
    );
  }

  Widget _buildReaderItem() {
    if (_readerModel == null) {
      return Center(
        child: Text('加载中...'),
      );
    }

    return ListView.builder(
      itemCount: _readerModel.pageUrl.length,
      itemBuilder: (ctx, index) {
        return _buildReaderItemImage(_readerModel.pageUrl[index]);
      },
    );
  }

  Widget _buildReaderItemImage(String url) {
    return Container(
      color: Colors.grey,
      child: Image.network(url, headers: {'Referer' : 'http://imgsmall.dmzj1.com/'},),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: Text(_readerModel == null ? '加载中...' : _readerModel.title),
      ),
      body: _buildReaderItem(),
    );
  }

  Widget _buildReaderItem() {
    if (_readerModel == null) {
      return Center(
        child: Text('加载中...', style: Theme.of(context).textTheme.subtitle2),
      );
    }

    return ListView.builder(
      itemCount: (_readerModel == null || _readerModel.pageUrl.isEmpty) ? 0 : _readerModel.pageUrl.length,
      itemBuilder: (ctx, index) {
        return _buildReaderItemImage(_readerModel.pageUrl[index]);
      },
    );
  }

  Widget _buildReaderItemImage(String url) {
    return Container(
      child: CachedNetworkImage(
        width: double.infinity,
        placeholder: (ctx, url) {
          return Image.asset('assets/images/other/xg_placeholder_img.png');
        },
        imageUrl: url,
        fit: BoxFit.fitHeight,
        httpHeaders: _readerModel.headers,
      ),
    );
  }
}

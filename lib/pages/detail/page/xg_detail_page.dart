import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/pages/detail/request/xg_detail_request.dart';
import 'package:xiguamanhua/pages/reader/page/xg_reader_page.dart';

class XGDetailPage extends StatefulWidget {
  static const String routeName = '/XGDetailPage';
  final manHuaId;

  XGDetailPage(this.manHuaId);

  @override
  _XGDetailPageState createState() => _XGDetailPageState();
}

class _XGDetailPageState extends State<XGDetailPage> {
  XGDetailModel _detailModel;

  ///
  void _onGoToReaderPage(int chapterId) {
    Navigator.of(context).pushNamed(
      XGReaderPage.routeName,
      arguments: [_detailModel.comicsId, chapterId, _detailModel.title],
    );
  }

  ///
  @override
  void initState() {
    super.initState();
    // 请求网络
    XGDetailRequest.requestDetailInfo(widget.manHuaId).then((rsp) {
      setState(() {
        _detailModel = rsp;
        print('zxd-log**: $rsp');
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_detailModel == null ? '' : _detailModel?.title),
      ),
      body: _buildDetailLayout(),
    );
  }

  /// 创建详情布局
  Widget _buildDetailLayout() {
    if (_detailModel == null) {
      return Center(
        child: Text(
          '加载中...',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      );
    }
    return CustomScrollView(
      slivers: [
        _buildDetailHeader(),
        _buildSpaceFill(20),
        _buildContentNavigate('简介:'),
        _buildProfileContent(),
        _buildSpaceFill(10),
        _buildContentNavigate('章节:'),
        _buildChapter(),
      ],
    );
  }

  /// 创建详情头部
  Widget _buildDetailHeader() {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: AlignmentDirectional.center,
        overflow: Overflow.visible,
        children: [
          _buildHeaderBackground(),
          _buildHeaderContent(),
        ],
      ),
    );
  }

  /// 创建头部背景
  Widget _buildHeaderBackground() {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.orange],
        ),
      ),
    );
  }

  /// 创建头部内容
  Widget _buildHeaderContent() {
    return Positioned(
      left: 30,
      bottom: -20,
      height: 165,
      child: Row(
        children: [
          _buildComicsImage(),
          SizedBox(width: 10),
          _buildComicsContent(),
        ],
      ),
    );
  }

  /// 创建图片
  Widget _buildComicsImage() {
    return Image.network(_detailModel?.cover);
  }

  /// 创建详细内容
  Widget _buildComicsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentItem('漫画：', _detailModel?.title),
        _buildContentItem('作者：', _detailModel?.author),
        _buildContentItem('类型：', _detailModel?.comicsType),
        _buildContentItem('状态：', _detailModel?.comicsStatus),
        _buildContentItem('订阅数量：', _detailModel?.subscribeNum.toString()),
      ],
    );
  }

  /// 创建内容
  Widget _buildContentItem(String label, String title) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Text(label),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(80, 80, 80, 1)),
          ),
        ],
      ),
    );
  }

  /// 创建间距
  Widget _buildSpaceFill(double space) {
    return SliverToBoxAdapter(
      child: Container(
        height: space,
      ),
    );
  }

  /// 创建导航
  Widget _buildContentNavigate(String title) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        height: 38,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color.fromRGBO(240, 240, 240, 1)),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// 创建简介内容区域
  Widget _buildProfileContent() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Expanded(
          child: Text(_detailModel?.description),
        ),
      ),
    );
  }

  /// 创建章节
  Widget _buildChapter() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          if (_detailModel.chapters == null) {
            return Container();
          }
          return _buildChapterItem(_detailModel?.chapters[index]);
        },
        childCount: _detailModel.chapters == null ? 0 : _detailModel.chapters.length,
      ),
    );
  }

  /// 创建章节item
  Widget _buildChapterItem(XGChapterModel model) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        height: 44,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color.fromRGBO(245, 245, 245, 1)),
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model?.chapterTitle),
              Icon(
                Icons.navigate_next,
                color: Color.fromRGBO(225, 225, 225, 1),
              ),
            ],
          ),
        ),
      ),
      onTap: () => _onGoToReaderPage(model.chapterId),
    );
  }
}

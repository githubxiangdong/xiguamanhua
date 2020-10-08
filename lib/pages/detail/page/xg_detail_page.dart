import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/pages/detail/request/xg_detail_request.dart';
import 'package:xiguamanhua/pages/reader/page/xg_reader_page.dart';

class XGDetailPage extends StatefulWidget {
  static const String routeName = '/XGDetailPage';
  final XGComicsModel model;

  XGDetailPage(this.model);

  @override
  _XGDetailPageState createState() => _XGDetailPageState();
}

class _XGDetailPageState extends State<XGDetailPage> {
  XGDetailModel _detailModel;

  ///
  void _onGoToReaderPage(int chapterId) {
    Navigator.of(context).pushNamed(
      XGReaderPage.routeName,
      arguments: [_detailModel.comicsId, chapterId, _detailModel.comicsName],
    );
  }

  ///
  @override
  void initState() {
    super.initState();
    // 请求网络
    XGDetailRequest.requestDetailInfo(widget.model.comicsId).then((rsp) {
      setState(() {
        _detailModel = rsp;
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: Text(_detailModel == null ? '' : _detailModel.comicsName),
      ),
      body: _buildDetailLayout(),
    );
  }

  /// 创建详情布局
  Widget _buildDetailLayout() {
    if (_detailModel == null) {
      return Center(
        child: Text('加载中...', style: Theme.of(context).textTheme.subtitle2),
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
        _buildSpaceFill(10),
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
      left: 25,
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
    return CachedNetworkImage(
      placeholder: (ctx, url) {
        return Image.asset('assets/images/other/xg_placeholder_img.png');
      },
      imageUrl: _detailModel.comicsCover,
      fit: BoxFit.fill,
    );
  }

  /// 创建详细内容
  Widget _buildComicsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentItem('漫画：', _detailModel?.comicsName),
        _buildContentItem('作者：', _detailModel?.author),
        _buildContentItem('类型：', _detailModel?.comicsType),
        _buildContentItem('状态：', _detailModel?.comicsStatus),
        _buildContentItem('更新话：', _detailModel?.lastUpdateChapterName),
        _buildContentItem('更新时间：', _detailModel?.lastUpdateTime),
      ],
    );
  }

  /// 创建内容
  Widget _buildContentItem(String label, String title) {
    TextStyle style = label == '漫画：'
        ? Theme.of(context).textTheme.subtitle1.copyWith(
              color: Color.fromRGBO(80, 80, 80, 1),
              fontWeight: FontWeight.bold,
            )
        : Theme.of(context).textTheme.bodyText2.copyWith(
              color: Color.fromRGBO(80, 80, 80, 1),
            );
    return Container(
      height: 20,
      child: Expanded(
        child: Row(
          children: [
            Text(label),
            Text(title, style: style),
          ],
        ),
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
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          return _buildChapterItem(_detailModel.chapters[index]);
        },
        childCount: ((_detailModel != null || _detailModel.chapters.isNotEmpty) ? _detailModel.chapters.length : 0),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.8,
      ),
    );
  }

  /// 创建章节item
  Widget _buildChapterItem(XGChapterModel model) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: Color.fromRGBO(220, 220, 220, 1)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(model.chapterTitle),
      ),
      onTap: () => _onGoToReaderPage(model.chapterId),
    );
  }
}

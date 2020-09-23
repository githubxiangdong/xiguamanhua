import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/detail/request/xg_detail_request.dart';

class XGDetailPage extends StatefulWidget {
  static const String routeName = '/XGDetailPage';
  final manHuaId;
  XGDetailPage(this.manHuaId);

  @override
  _XGDetailPageState createState() => _XGDetailPageState();
}

class _XGDetailPageState extends State<XGDetailPage> {

  @override
  void initState() {
    super.initState();
    // 请求网络
    XGDetailRequest.requestDetailInfo(widget.manHuaId);
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('漫画标题'),
      ),
      body: _buildDetailLayout(),
    );
  }

  /// 创建详情布局
  Widget _buildDetailLayout() {
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
          Container(
            height: 165,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.orange],
              ),
            ),
          ),
          Positioned(
            left: 30,
            bottom: -15,
            height: 160,
            child: Image.network('https://images.dmzj1.com/webpic/6/wjdnnbblsndsl202092.jpg'),
          )
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
          child: Text('欢迎关注「蛇崽网盘教程资源」公众号 ，在微信后台回复「领取资源」，获取IT资源200G干货大全。'
              '在微信后台回复「Flutter移动电商」，即可免费领取Flutter移动电商系列全套'),
        ),
      ),
    );
  }

  /// 创建章节
  Widget _buildChapter() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          return _buildChapterItem();
        },
        childCount: 20,
      ),
    );
  }

  /// 创建章节item
  Widget _buildChapterItem() {
    return Container(
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
            Text('第1话 1 话'),
            Icon(Icons.navigate_next, color: Color.fromRGBO(225, 225, 225, 1),),
          ],
        ),
      ),
    );
  }
}

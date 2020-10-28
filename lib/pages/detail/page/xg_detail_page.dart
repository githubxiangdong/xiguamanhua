import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/pages/detail/request/xg_detail_request.dart';
import 'package:xiguamanhua/pages/detail/widget/xg_detail_bottom_sheet.dart';
import 'package:xiguamanhua/pages/detail/widget/xg_detail_chapter.dart';
import 'package:xiguamanhua/pages/detail/widget/xg_detail_header.dart';
import 'package:xiguamanhua/pages/detail/widget/xg_detail_section_header.dart';

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
      bottomSheet: XGDetailBottomSheet(widget.model, _detailModel),
    );
  }

  /// 创建详情布局
  Widget _buildDetailLayout() {
    if (_detailModel == null) {
      return Center(
        child: Text('加载中...', style: Theme.of(context).textTheme.subtitle2),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, (44.0 + 38.0)),
      child: CustomScrollView(
        slivers: [
          XGDetailHeader(_detailModel),
          _buildSpaceFill(20),
          XGDetailSectionHeader('简介:'),
          _buildProfileContent(),
          _buildSpaceFill(10),
          XGDetailSectionHeader('章节:'),
          _buildSpaceFill(10),
          XGDetailChapter(_detailModel),
        ],
      ),
    );
  }

  /// 创建间距
  Widget _buildSpaceFill(double space) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.red,
        height: space,
      ),
    );
  }

  /// 创建简介内容区域
  Widget _buildProfileContent() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Text(_detailModel.description),
      ),
    );
  }
}

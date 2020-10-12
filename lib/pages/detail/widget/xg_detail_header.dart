import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';

class XGDetailHeader extends StatefulWidget {
  final XGDetailModel detailModel;
  XGDetailHeader(this.detailModel);

  @override
  _XGDetailHeaderState createState() => _XGDetailHeaderState();
}

class _XGDetailHeaderState extends State<XGDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return _buildDetailHeader();
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
      imageUrl: widget.detailModel.comicsCover,
      fit: BoxFit.fill,
    );
  }

  /// 创建详细内容
  Widget _buildComicsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentItem('漫画：', widget.detailModel.comicsName),
        _buildContentItem('作者：', widget.detailModel.author),
        _buildContentItem('类型：', widget.detailModel.comicsType),
        _buildContentItem('状态：', widget.detailModel.comicsStatus),
        _buildContentItem('更新话：', widget.detailModel.lastUpdateChapterName),
        _buildContentItem('更新时间：', widget.detailModel.lastUpdateTime),
      ],
    );
  }

  /// 创建内容
  Widget _buildContentItem(String label, String title) {
    TextStyle style = label == '漫画：'
        ? Theme.of(context).textTheme.subtitle1.copyWith(
      fontWeight: FontWeight.bold,
    )
        : Theme.of(context).textTheme.bodyText2.copyWith(
      color: Color.fromRGBO(80, 80, 80, 1),
    );
    return Container(
      height: 20,
      child: Row(
        children: [
          Text(label),
          Text(title, style: style),
        ],
      ),
    );
  }
}

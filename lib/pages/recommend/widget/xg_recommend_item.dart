import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';

class XGRecommendItem extends StatefulWidget {
  final model;
  final ratio;
  XGRecommendItem(this.model, this.ratio);
  @override
  _XGRecommendItemState createState() => _XGRecommendItemState();
}

class _XGRecommendItemState extends State<XGRecommendItem> {
  /// 点击事件
  void _onGoToDetailPage() {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: widget.model);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSectionItemInfo();
  }

  Widget _buildSectionItemInfo() {
    return GestureDetector(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(),
            SizedBox(height: 3),
            _buildItemInfo(),
          ],
        ),
      ),
      onTap: () => _onGoToDetailPage(),
    );
  }

  Widget _buildItemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: AspectRatio(
        aspectRatio: widget.ratio,
        child: CachedNetworkImage(
          placeholder: (ctx, url) {
            return Image.asset('assets/images/other/xg_placeholder_img.png');
          },
          imageUrl: widget.model.comicsCover,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildItemInfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.model.comicsName,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.model.comicsStatus,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

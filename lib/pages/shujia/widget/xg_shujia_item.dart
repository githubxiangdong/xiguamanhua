import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';

class XGShuJiaItem extends StatefulWidget {
  final XGComicsModel model;
  XGShuJiaItem(this.model);

  @override
  _XGShuJiaItemState createState() => _XGShuJiaItemState();
}

class _XGShuJiaItemState extends State<XGShuJiaItem> {
  /// 点击事件
  void _onGoToDetailPage() {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: widget.model);
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  Widget _buildItem() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildItemImage(),
            SizedBox(height: 3),
            _buildItemText(),
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
        aspectRatio: 0.78,
        child: CachedNetworkImage(
          placeholder: (ctx, url) {
            return Image.asset(XGAppTheme.placeholder);
          },
          imageUrl: widget.model.comicsCover,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildItemText() {
    return Expanded(
      child: Container(
        child: Text(widget.model.comicsName, maxLines: 1, overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}

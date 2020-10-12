import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';

class XGSearchResultList extends StatefulWidget {
  final List<XGComicsModel> resultList;

  XGSearchResultList(this.resultList);

  @override
  _XGSearchResultListState createState() => _XGSearchResultListState();
}

class _XGSearchResultListState extends State<XGSearchResultList> {
  /// 点击事件
  void _onGoToDetailPage(XGComicsModel model) {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: model);
  }

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  /// 创建列表
  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return _buildItem(widget.resultList[index]);
      },
      itemCount: widget.resultList.length,
    );
  }

  /// 创建item
  Widget _buildItem(XGComicsModel model) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 5, 0, 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: XGAppTheme.splitLineColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(model),
            SizedBox(width: 10),
            _buildItemContent(model),
          ],
        ),
      ),
      onTap: () => _onGoToDetailPage(model),
    );
  }

  /// 创建itemImage
  Widget _buildItemImage(XGComicsModel model) {
    return Container(
      height: 120,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            placeholder: (ctx, url) {
              return Image.asset('assets/images/other/xg_placeholder_img.png');
            },
            imageUrl: model.comicsCover,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  /// 创建itemInfo
  Widget _buildItemContent(XGComicsModel model) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 8, 5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.comicsName,
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: XGAppTheme.white_240_Color),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            _buildContent(Icons.people, model.authors),
            SizedBox(height: 5),
            _buildContent(Icons.style, model.comicsTypes),
            SizedBox(height: 5),
            _buildContent(Icons.calendar_today, model.lastName),
          ],
        ),
      ),
    );
  }

  ///
  Widget _buildContent(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 18),
        SizedBox(width: 5),
        Text(text, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}

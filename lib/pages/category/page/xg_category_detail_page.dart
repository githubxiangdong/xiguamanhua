import 'package:cached_network_image/cached_network_image.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/category/request/xg_category_detail_request.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';

class XGCategoryDetailPage extends StatefulWidget {
  static const String routeName = '/XGCategoryDetailPage';
  final categoryId;
  final title;

  XGCategoryDetailPage(this.categoryId, this.title);

  @override
  _XGCategoryDetailPageState createState() => _XGCategoryDetailPageState();
}

class _XGCategoryDetailPageState extends State<XGCategoryDetailPage> {
  List<XGComicsModel> _comicsModelList;

  /// 点击事件
  void _onGoToDetailPage(XGComicsModel model) {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: model);
  }

  @override
  void initState() {
    super.initState();
    XGCategoryDetailRequest.requestCategoryDetailList(widget.categoryId, 0).then((rsp) {
      setState(() {
        _comicsModelList = rsp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: _buildItems(),
      ),
    );
  }

  Widget _buildItems() {
    if (_comicsModelList == null || _comicsModelList.length <= 0) {
      return Center(
        child: Text('加载中...', style: Theme.of(context).textTheme.subtitle2),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 8,
        childAspectRatio: 0.61,
      ),
      itemBuilder: (ctx, index) {
        return _buildItemContent(_comicsModelList[index]);
      },
      itemCount: _comicsModelList.isNotEmpty ? _comicsModelList.length : 0,
    );
  }

  Widget _buildItemContent(XGComicsModel model) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(model),
            SizedBox(height: 3),
            _buildItemInfo(model),
          ],
        ),
      ),
      onTap: () => _onGoToDetailPage(model),
    );
  }

  Widget _buildItemImage(XGComicsModel model) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: CachedNetworkImage(
          placeholder: (ctx, url) {
            return Image.asset('assets/images/other/xg_placeholder_img.png');
          },
          imageUrl: model.comicsCover,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildItemInfo(XGComicsModel model) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.comicsName,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            model.authors,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

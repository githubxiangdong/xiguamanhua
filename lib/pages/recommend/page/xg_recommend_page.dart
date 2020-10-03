import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_floor_model.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:xiguamanhua/pages/recommend/request/xg_recommend_request.dart';

class XGRecommendPage extends StatefulWidget {
  static const String routeName = '/XGRecommendPage';

  @override
  _XGRecommendPageState createState() => _XGRecommendPageState();
}

class _XGRecommendPageState extends State<XGRecommendPage> {
  XGFloorModel _floorModel;

  /// 点击事件
  void _onGoToDetailPage(XGComicsModel model) {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: model);
  }

  ///
  @override
  void initState() {
    super.initState();
    // 发送网络请求
    XGRecommendRequest.requestRecommendList('https://m.gufengmh8.com').then((rsp) {
      setState(() {
        // _floorModel = rsp;
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    if (_floorModel == null || _floorModel.floorCount <= 0) {
      return Center(
        child: Text('加载中...', style: Theme.of(context).textTheme.subtitle2),
      );
    }
    return CustomScrollView(
      slivers: [
        _buildSectionHeader(_floorModel.floor_1),
        _buildSectionItem(_floorModel.floor_1.comicsList),
        _buildSectionHeader(_floorModel.floor_2),
        _buildSectionItem(_floorModel.floor_2.comicsList),
        _buildSectionHeader(_floorModel.floor_3),
        _buildSectionItem(_floorModel.floor_3.comicsList),
        _buildSectionHeader(_floorModel.floor_4),
        _buildSectionItem(_floorModel.floor_4.comicsList),
        _buildSectionHeader(_floorModel.floor_5),
        _buildSectionItem(_floorModel.floor_5.comicsList),
      ],
    );
  }

  /// 创建组头
  Widget _buildSectionHeader(XGRecommendModel model) {
    return SliverToBoxAdapter(
      child: Container(
        height: 30,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 14,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            SizedBox(width: 3),
            Text(
              model?.categoryName,
              style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  /// 创建组
  Widget _buildSectionItem(List<XGComicsModel> comicsList) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.68,
      ),
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          return _buildSectionItemInfo(comicsList[index]);
        },
        childCount: comicsList.length,
      ),
    );
  }

  Widget _buildSectionItemInfo(XGComicsModel model) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.8,
              child: CachedNetworkImage(
                placeholder: (ctx, url) {
                  return Image.asset('assets/images/other/xg_placeholder_img.png');
                },
                imageUrl: model.comicsCover,
                fit: BoxFit.fill,
                httpHeaders: model.headers,
              ),
            ),
            SizedBox(height: 3),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                model.comicsName,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                model.comicsProfile,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
      onTap: () => _onGoToDetailPage(model),
    );
  }
}

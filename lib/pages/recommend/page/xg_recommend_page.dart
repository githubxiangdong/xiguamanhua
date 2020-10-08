import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_floor_model.dart';
import 'package:xiguamanhua/pages/recommend/request/xg_recommend_request.dart';
import 'package:xiguamanhua/pages/recommend/widget/xg_recommend_banner.dart';
import 'package:xiguamanhua/pages/recommend/widget/xg_recommend_floor_style.dart';
import 'package:xiguamanhua/pages/recommend/widget/xg_recommend_section_header.dart';

class XGRecommendPage extends StatefulWidget {
  static const String routeName = '/XGRecommendPage';

  @override
  _XGRecommendPageState createState() => _XGRecommendPageState();
}

class _XGRecommendPageState extends State<XGRecommendPage> {
  XGFloorModel _floorModel;

  ///
  @override
  void initState() {
    super.initState();
    // 发送网络请求
    XGRecommendRequest.requestRecommendList().then((rsp) {
      setState(() {
        _floorModel = rsp;
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
    return _buildItemContent();
  }

  Widget _buildItemContent() {
    return CustomScrollView(
      slivers: [
        XGRecommendBanner(),
        XGRecommendSectionHeader(_floorModel.floor_1.categoryName),
        XGRecommendFloorStyle1(_floorModel.floor_1.comicsList, XGRecommendFloorStyle.floor_style_1),
        XGRecommendSectionHeader(_floorModel.floor_2.categoryName),
        XGRecommendFloorStyle1(_floorModel.floor_2.comicsList, XGRecommendFloorStyle.floor_style_1),
        XGRecommendSectionHeader(_floorModel.floor_3.categoryName),
        XGRecommendFloorStyle1(_floorModel.floor_3.comicsList, XGRecommendFloorStyle.floor_style_1),
        XGRecommendSectionHeader(_floorModel.floor_4.categoryName),
        XGRecommendFloorStyle1(_floorModel.floor_4.comicsList, XGRecommendFloorStyle.floor_style_2),
        XGRecommendSectionHeader(_floorModel.floor_5.categoryName),
        XGRecommendFloorStyle1(_floorModel.floor_5.comicsList, XGRecommendFloorStyle.floor_style_1),
      ],
    );
  }
}

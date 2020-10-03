import 'package:html/dom.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';

class XGFloorModel {
  // 这是推荐页面的楼层配置模型，目前最多支持5层楼
  XGRecommendModel floor_1;
  XGRecommendModel floor_2;
  XGRecommendModel floor_3;
  XGRecommendModel floor_4;
  XGRecommendModel floor_5;
  int floorCount = 0;

  XGFloorModel({
    this.floor_1,
    this.floor_2,
    this.floor_3,
    this.floor_4,
    this.floor_5,
    this.floorCount,
  });

  XGFloorModel.fromModel(Document document) {
    final categoryList = document.getElementsByTagName('div');
    for (var category in categoryList) {
      if (category.className == 'manga-area') {
        XGRecommendModel model = XGRecommendModel.formElement(category);
        recommendModelToFloorModel(model);
      }
    }
  }

  // 后期需要优化处理这个逻辑
  void recommendModelToFloorModel(XGRecommendModel model) {
    if (model.categoryName.contains('编辑推荐')) {
      model.categoryName = '西瓜推荐';
      floor_1 = model;
      floorCount = 1;
    } else if (model.categoryName.contains('BL漫画')) {
      model.categoryName = '热门漫画';
      floor_2 = model;
      floorCount = 2;
    } else if (model.categoryName.contains('热门更新')) {
      model.categoryName = '最近更新';
      floor_3 = model;
      floorCount = 3;
    } else if (model.categoryName.contains('少年漫画')) {
      floor_4 = model;
      floorCount = 4;
    } else if (model.categoryName.contains('少女漫画')) {
      floor_5 = model;
      floorCount = 5;
    }
  }

  @override
  String toString() {
    return 'XGFloorModel{floor_1: $floor_1, floor_2: $floor_2, floor_3: $floor_3, floor_4: $floor_4, floor_5: $floor_5, floorCount: $floorCount}';
  }
}

import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:html/dom.dart';

class XGRecommendModel {
  int categoryId; // 分类id
  String categoryName; // 分类名
  String categoryMoreUrl; // 分类跟多链接
  List<XGComicsModel> comicsList; // 漫画数组

  XGRecommendModel({
    this.categoryId,
    this.categoryName,
    this.categoryMoreUrl,
    this.comicsList,
  });

  XGRecommendModel.formElement(Element element) {
    // 1. 获取分类名和更多链接
    categoryName = element.getElementsByTagName('h3').first.text;
    // print('zxd-log: category +++++ $categoryName');

    comicsList = List<XGComicsModel>();
    // 2. 获取漫画封面、名称、描述等信息
    final detailList = element.getElementsByTagName('div');
    for (var detail in detailList) {
      if (detail.className == 'manga-cover') {
        // print('zxd-log: detail >>>>> ${detail.outerHtml}');
        comicsList.add(XGComicsModel.fromElement(detail));
      }
    }
  }

  @override
  String toString() {
    return 'XGRecommendModel{categoryId: $categoryId, categoryName: $categoryName, categoryMoreUrl: $categoryMoreUrl, comicsList: $comicsList}';
  }
}

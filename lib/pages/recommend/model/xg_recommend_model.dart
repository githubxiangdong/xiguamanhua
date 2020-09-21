class XGRecommendModel {
  int categoryId;
  String title;
  int sort;
  String cover;
  String titleName;
  String subTitle;
  int type;
  String url;
  int objId;
  String status;

  XGRecommendModel({
    this.categoryId,
    this.title,
    this.sort,
    this.cover,
    this.titleName,
    this.subTitle,
    this.type,
    this.url,
    this.objId,
    this.status,
  });

  @override
  String toString() {
    return 'XGRecommendModel{categoryId: $categoryId, title: $title, sort: $sort, cover: $cover, titleName: $titleName, subTitle: $subTitle, type: $type, url: $url, objId: $objId, status: $status}';
  }
}


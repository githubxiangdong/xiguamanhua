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
  List<XGRecommendData> recommendDatas;

  XGRecommendModel({
    this.categoryId,
    this.title,
    this.sort,
    this.recommendDatas,
    this.cover,
    this.titleName,
    this.subTitle,
    this.type,
    this.url,
    this.objId,
    this.status,
  });

  XGRecommendModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    title = json['title'];
    sort = json['sort'];
    if (json['data'] != null) {
      recommendDatas = new List<XGRecommendData>();
      json['data'].forEach((v) {
        recommendDatas.add(new XGRecommendData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['sort'] = this.sort;
    if (this.recommendDatas != null) {
      data['data'] = this.recommendDatas.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'XGRecommendModel{categoryId: $categoryId, title: $title, sort: $sort, cover: $cover, titleName: $titleName, subTitle: $subTitle, type: $type, url: $url, objId: $objId, status: $status}';
  }
}

class XGRecommendData {
  String cover;
  String title;
  String subTitle;
  int type;
  String url;
  int objId;
  String status;

  XGRecommendData({
    this.cover,
    this.title,
    this.subTitle,
    this.type,
    this.url,
    this.objId,
    this.status,
  });

  XGRecommendData.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    title = json['title'];
    subTitle = json['sub_title'];
    type = json['type'];
    url = json['url'];
    objId = json['obj_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['type'] = this.type;
    data['url'] = this.url;
    data['obj_id'] = this.objId;
    data['status'] = this.status;
    return data;
  }

  @override
  String toString() {
    return 'XGRecommendData{cover: $cover, title: $title, subTitle: $subTitle, type: $type, url: $url, objId: $objId, status: $status}';
  }
}

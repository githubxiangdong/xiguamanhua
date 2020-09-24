class XGDetailModel {
  int comicsId; // 漫画id
  String title; // 漫画名称
  String cover; // 漫画封面
  String description; // 漫画简介
  int lastUpdateTime; // 漫画最近一次更新时间
  String lastUpdateChapterName; // 漫画最近一次更新章节名
  int lastUpdateChapterId; // 漫画最近一次更新章节id
  String comicsType; // 漫画类型
  String comicsStatus; // 漫画更新状态
  String author; // 漫画作者
  int subscribeNum; // 订阅数量
  List<XGChapterModel> chapters; // 漫画章节

  XGDetailModel({
    this.comicsId,
    this.title,
    this.cover,
    this.description,
    this.lastUpdateTime,
    this.lastUpdateChapterName,
    this.lastUpdateChapterId,
    this.comicsType,
    this.comicsStatus,
    this.author,
    this.subscribeNum,
    this.chapters,
  });

  XGDetailModel.fromJson(Map<String, dynamic> json) {
    comicsId = json['id'];
    title = json['title'];
    cover = json['cover'];
    description = json['description'];
    lastUpdateTime = json['last_updatetime'];
    lastUpdateChapterName = json['last_update_chapter_name'];
    lastUpdateChapterId = json['last_update_chapter_id'];
    subscribeNum = json['subscribe_num'];

    if (json['types'] != null) {
      json['types'].forEach((v) {
        comicsType = comicsType == null ? '${v['tag_name']}' : '$comicsType/${v['tag_name']}';
      });
    }
    if (json['status'] != null) {
      json['status'].forEach((v) {
        comicsStatus = comicsStatus == null ? '${v['tag_name']}' : '$comicsStatus/${v['tag_name']}';
      });
    }
    if (json['authors'] != null) {
      json['types'].forEach((v) {
        author = author == null ? '${v['tag_name']}' : '$author/${v['tag_name']}';
      });
    }
    if (json['chapters'] != null) {
      json['chapters'].forEach((chapterDic) {
        if (chapterDic['data'] != null) {
          chapters = List<XGChapterModel>();
          chapterDic['data'].forEach((dataDic) {
            chapters.add(XGChapterModel.fromJson(dataDic));
          });
        }
      });
    }
  }

  @override
  String toString() {
    return 'XGDetailModel{comicsId: $comicsId, title: $title, cover: $cover, description: $description, lastUpdateTime: $lastUpdateTime, lastUpdateChapterName: $lastUpdateChapterName, lastUpdateChapterId: $lastUpdateChapterId, comicsType: $comicsType, comicsStatus: $comicsStatus, author: $author, subscribeNum: $subscribeNum, chapters: $chapters}';
  }
}

class XGChapterModel {
  int chapterId;
  String chapterTitle;
  int updateTime;
  int fileSize;
  int chapterOrder;

  XGChapterModel({
    this.chapterId,
    this.chapterTitle,
    this.updateTime,
    this.fileSize,
    this.chapterOrder,
  });

  XGChapterModel.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapter_id'];
    chapterTitle = json['chapter_title'];
    updateTime = json['updatetime'];
    fileSize = json['filesize'];
    chapterOrder = json['chapter_order'];
  }

  @override
  String toString() {
    return 'XGChapterModel{chapterId: $chapterId, chapterTitle: $chapterTitle, updateTime: $updateTime, fileSize: $fileSize, chapterOrder: $chapterOrder}';
  }
}

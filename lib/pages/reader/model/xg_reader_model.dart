class XGReaderModel {
  int chapterId;
  int comicId;
  String title;
  int chapterOrder;
  int direction;
  List<String> pageUrl;
  int picnum;
  int commentCount;

  XGReaderModel(
      {this.chapterId,
        this.comicId,
        this.title,
        this.chapterOrder,
        this.direction,
        this.pageUrl,
        this.picnum,
        this.commentCount});

  XGReaderModel.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapter_id'];
    comicId = json['comic_id'];
    title = json['title'];
    chapterOrder = json['chapter_order'];
    direction = json['direction'];
    pageUrl = json['page_url'].cast<String>();
    picnum = json['picnum'];
    commentCount = json['comment_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter_id'] = this.chapterId;
    data['comic_id'] = this.comicId;
    data['title'] = this.title;
    data['chapter_order'] = this.chapterOrder;
    data['direction'] = this.direction;
    data['page_url'] = this.pageUrl;
    data['picnum'] = this.picnum;
    data['comment_count'] = this.commentCount;
    return data;
  }

  @override
  String toString() {
    return 'XGReaderModel{chapterId: $chapterId, comicId: $comicId, title: $title, chapterOrder: $chapterOrder, direction: $direction, pageUrl: $pageUrl, picnum: $picnum, commentCount: $commentCount}';
  }
}
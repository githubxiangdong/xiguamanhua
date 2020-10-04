class XGReaderModel {
  int chapterId = 0;
  int comicId = 0;
  String title = '';
  int chapterOrder = 0;
  int direction = 0;
  List<String> pageUrl = [];
  int picnum = 0;
  int commentCount = 0;
  Map<String, String> headers = {};

  XGReaderModel(
      {this.chapterId,
        this.comicId,
        this.title,
        this.chapterOrder,
        this.direction,
        this.pageUrl,
        this.picnum,
        this.commentCount,
        this.headers
      });

  XGReaderModel.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapter_id'];
    comicId = json['comic_id'];
    title = json['title'];
    chapterOrder = json['chapter_order'];
    direction = json['direction'];
    pageUrl = json['page_url'].cast<String>();
    picnum = json['picnum'];
    commentCount = json['comment_count'];

    headers = {
      'Host': 'imgsmall.dmzj1.com',
      'Accept': 'image/*;q=0.8',
      // 'User-Agent': '动漫之家Pro/155 CFNetwork/1128.0.1 Darwin/19.6.0',
      'Accept-Language': 'zh-cn',
      'Referer': 'http://imgsmall.dmzj1.com/',
      'Accept-Encoding': 'gzip, deflate',
      'Connection': 'keep-alive',
    };
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
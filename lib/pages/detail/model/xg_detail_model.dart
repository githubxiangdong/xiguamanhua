import 'package:html/dom.dart';

class XGDetailModel {
  int comicsId = 0; // 漫画id
  String comicsName = ''; // 漫画名称
  String comicsCover = ''; // 漫画封面
  String description = ''; // 漫画简介
  String lastUpdateTime = ''; // 漫画最近一次更新时间
  String lastUpdateChapterName = ''; // 漫画最近一次更新章节名
  int lastUpdateChapterId = 0; // 漫画最近一次更新章节id
  String comicsType = ''; // 漫画类型
  String comicsStatus = ''; // 漫画更新状态
  String author = ''; // 漫画作者
  int subscribeNum = 0; // 订阅数量
  String grade = ''; // 评分
  List<XGChapterModel> chapters = []; // 漫画章节
  Map<String, String> headers = {};

  XGDetailModel({
    this.comicsId,
    this.comicsName,
    this.comicsCover,
    this.description,
    this.lastUpdateTime,
    this.lastUpdateChapterName,
    this.lastUpdateChapterId,
    this.comicsType,
    this.comicsStatus,
    this.author,
    this.subscribeNum,
    this.grade,
    this.chapters,
    this.headers,
  });

  XGDetailModel.fromJson(Map<String, dynamic> json) {
    comicsId = json['id'] == null ? 0 : json['id'];
    comicsName = json['title'] == null ? '' : json['title'];
    comicsCover = json['cover'] == null ? '' : json['cover'];
    description = json['description'] == null ? '' : json['description'];
    lastUpdateChapterName = json['last_update_chapter_name'] == null ? '' : json['last_update_chapter_name'];

    int time = json['last_updatetime'] == null ? 0 : json['last_updatetime'];
    lastUpdateTime = DateTime.fromMicrosecondsSinceEpoch(time * 1000).toString();

    if (json['types'] != null) {
      json['types'].forEach((v) {
        final tagName = v['tag_name'] == null ? '' : v['tag_name'];
        comicsType = comicsType == '' ? tagName : '$comicsType $tagName';
      });
    }

    if (json['status'] != null) {
      json['status'].forEach((v) {
        final tagName = v['tag_name'] == null ? '' : v['tag_name'];
        comicsStatus = comicsStatus == '' ? tagName : '$comicsStatus $tagName';
      });
    }

    if (json['authors'] != null) {
      json['authors'].forEach((v) {
        final tagName = v['tag_name'] == null ? '' : v['tag_name'];
        author = author == '' ? tagName : '$author $tagName';
      });
    }

    if (json['chapters'] != null) {
      final chapter = json['chapters'].first;
      if (chapter['data'] != null) {
        chapters = List<XGChapterModel>();
        chapter['data'].forEach((v) {
          chapters.add(XGChapterModel.fromJson(v));
        });
      }
    }
  }

  XGDetailModel.fromDocument(Document document) {
    final contentList = document.getElementsByTagName('div');

    for (var content in contentList) {
      if (content.className == 'content detail-page') {

        // 1. 封面图，作者等
        comicsCover = content.getElementsByTagName('mip-img').first.attributes['src'];
        comicsName = content.getElementsByTagName('h2').first.text;
        print('zxd-log: comicsCover >>>>> $comicsCover');
        print('zxd-log: comicsName >>>>> $comicsName');

        final propertyList = content.getElementsByTagName('div');
        for (var property in propertyList) {
          if (property.className.contains('mg-property')) {
            final aList = property.getElementsByTagName('a');
            for (var i = 0; i < aList.length; i++) {
              if (i == 0) {
                author = aList[i].text;
              } else {
                comicsType = comicsType == null ? aList[i].text : '$comicsType/${aList[i].text}';
              }
            }

            print('zxd-log: author >>>>> $author');
            print('zxd-log: comicsType >>>>> $comicsType');
          }
        }

        // 2. 简介
        final descriptionList = content.getElementsByTagName('div');
        for (var desc in descriptionList) {
          if (desc.className.contains('manga-introduction')) {
            description = desc.getElementsByTagName('mip-showmore').first.text;
            print('zxd-log: description >>>>> $description');
            break;
          }
        }

        // 3. 评分 跟新时间
        final gradeList = content.getElementsByTagName('p');
        for (var g in gradeList) {
          if (g.className.contains('score')) {
            grade = g.text == null ? 5.0 : g.text;
            print('zxd-log: grade >>>>> ${g.text}');
          } else if (g.className.contains('time')) {
            lastUpdateTime = g.text == null ? '未知' : g.text;
            print('zxd-log: lastUpdateTime >>>>> $lastUpdateTime');
          }
        }

        // 4. 状态
        final statusList = content.getElementsByTagName('div');
        for (var status in statusList) {
          if (status.className.contains('ongoing-status')) {
            comicsStatus = status.text == null ? '未知' : status.text;
            print('zxd-log: comicsStatus >>>>> ${comicsStatus.toString()}');
            break;
          }
        }

        // 章节
        final chapterList = content.getElementsByTagName('div');
        for (var chapter in chapterList) {
          if (chapter.className.contains('links-area')) {
            print('zxd-log: chapterUrl >>>>> ${chapter.outerHtml}');
            XGChapterModel.fromElement(chapter);
          }
        }
      }
    }

    headers = {
      'Accept': 'image/png,image/svg+xml,image/*;q=0.8,video/*;q=0.8,*/*;q=0.5',
      'Pragma': 'no-cache',
      'Cache-Control': ' no-cache',
      'Host': 'c.nationaltcm.com',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15',
      'Accept-Language': 'zh-cn',
      'Referer': 'https://m.happymh.com/',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };
  }
}

class XGChapterModel {
  int chapterId = 0;
  String chapterTitle = '';
  int updateTime = 0;
  int fileSize = 0;
  int chapterOrder = 0;
  String chapterUrl = ''; // 章节url
  bool isNew = false;

  XGChapterModel({
    this.chapterId,
    this.chapterTitle,
    this.updateTime,
    this.fileSize,
    this.chapterOrder,
    this.chapterUrl,
    this.isNew,
  });

  XGChapterModel.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapter_id'] == null ? 0 : json['chapter_id'];
    chapterTitle = json['chapter_title'] == null ? '' : json['chapter_title'];
  }

  XGChapterModel.fromElement(Element element) {
    final chapterA = element.getElementsByTagName('a').first;
    chapterUrl = chapterA.attributes['href'];
    chapterTitle = chapterA.text;
    final newList = chapterA.getElementsByTagName('span');
    for (var n in newList) {
      isNew = n.className.contains('new');
    }
    print('zxd-log: chapterUrl >>>>> $chapterUrl');
    print('zxd-log: chapterTitle >>>>> $chapterTitle');
  }
}

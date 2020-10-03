import 'dart:io';

import 'package:html/dom.dart';

class XGDetailModel {
  int comicsId; // 漫画id
  String comicsName; // 漫画名称
  String comicsCover; // 漫画封面
  String description; // 漫画简介
  String lastUpdateTime; // 漫画最近一次更新时间
  String lastUpdateChapterName; // 漫画最近一次更新章节名
  int lastUpdateChapterId; // 漫画最近一次更新章节id
  String comicsType; // 漫画类型
  String comicsStatus; // 漫画更新状态
  String author; // 漫画作者
  int subscribeNum; // 订阅数量
  String grade; // 评分
  List<XGChapterModel> chapters; // 漫画章节
  Map<String, String> headers;

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
            lastUpdateTime = g.text == null ? '最近' : g.text;
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
  int chapterId;
  String chapterTitle;
  int updateTime;
  int fileSize;
  int chapterOrder;
  String chapterUrl; // 章节url
  bool isNew;

  XGChapterModel({
    this.chapterId,
    this.chapterTitle,
    this.updateTime,
    this.fileSize,
    this.chapterOrder,
    this.chapterUrl,
    this.isNew,
  });

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

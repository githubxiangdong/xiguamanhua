import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class XGHtmlParse {
  Map <String, dynamic> xgHtmlParseMap = Map();

  void htmlParse(String htmlUrl) async {
    print('++++开始解析数据++++');
    final response = await Dio().get(htmlUrl);
    final document = parse(response.data);
    print('++++结束解析数据++++');

    // _navigatorInfo(document);
    _contentInfo(document);

    print('zxd-log: xgHtmlParseMap ++ ${xgHtmlParseMap.toString()}');
  }

  void _navigatorInfo(Document doc) {
    final tagList = doc.getElementsByTagName('ul');
    for (var tag in tagList) {
      final className = tag.className;
      if (className == 'nav autoHeight') {
        // print('zxd-log className +++ : $className');
        final liList = tag.getElementsByTagName('li');
        List<dynamic> navigatorList = [];
        for (var li in liList) {
          final liHtml = li.outerHtml;
          // print('zxd-log +++2: $liHtml');
          final href = _subString('href="', '/"', liHtml);
          // print('zxd-log +++3: $href');
          Map map = {'href' : href, 'title' : li.text};
          navigatorList.add(map);
        }

        // print('zxd-log: navigatorList ++ ${navigatorList.toString()}');
        xgHtmlParseMap['navigator'] = navigatorList;
      }
    }
  }

  void _contentInfo(Document doc) {
    final categoryList = doc.getElementsByTagName('div');
    for (var category in categoryList) {
      if (category.className == 'imgBox') {
        final subHeaderList = category.getElementsByTagName('div');
        final subHeader = subHeaderList.first;
        final subTitle = subHeader.text;
        final moreList = subHeader.getElementsByTagName('a');
        final href = moreList.first.attributes['href'];
        print('zxd-log: $href');
      }
    }
  }

  String _subString(String start, String end, String substring) {
    final startIndexLength = start.length;
    final startIndex = substring.indexOf(start);
    final endIndex = substring.indexOf(end);
    final newString = substring.substring(startIndex + startIndexLength, endIndex+1);
    return newString;
  }
}
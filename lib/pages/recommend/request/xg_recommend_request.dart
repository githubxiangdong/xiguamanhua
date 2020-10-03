import 'package:html/parser.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_floor_model.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:xiguamanhua/service/http_request.dart';

class XGRecommendRequest {
  static Future<XGFloorModel> requestRecommendList(String htmlUrl) async {
    print('++++开始解析数据++++');
    htmlUrl = 'https://m.happymh.com';
    Map<String, dynamic> headers = {
      'Cookie': 'Hm_lpvt_41c11edf5dd2000ce3e9a84e746d3ca3=1601733732; Hm_lvt_41c11edf5dd2000ce3e9a84e746d3ca3=1601693824; _ga=GA1.2.731660466.1601693822; _gat=1; _gid=GA1.2.1486212030.1601693822; PHPSESSID=20fjrsjb5jsp5h9gdsg1pp4ofm',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'Accept-Encoding': 'gzip, deflate, br',
      'Host': 'm.happymh.com',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15',
      'Accept-Language': 'zh-cn',
      'Referer': 'https://m.happymh.com/checkRobot',
      'Connection': 'keep-alive',
    };

    final response = await HttpRequest.request(htmlUrl, headers: headers);
    final document = parse(response);
    XGFloorModel floorModel = XGFloorModel();

    final categoryList = document.getElementsByTagName('div');
    for (var category in categoryList) {
      if (category.className == 'manga-area') {
        XGRecommendModel model = XGRecommendModel.formElement(category);
        floorModel.recommendModelToFloorModel(model);
      }
    }
    return floorModel;
  }
}

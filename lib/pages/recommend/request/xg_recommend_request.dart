import 'package:html/parser.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_floor_model.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGRecommendRequest {
  static Future<XGFloorModel> requestRecommendList() async {
    final url1 = '${XGServiceConfig.baseURL_source1}/recommend_index_ios.json?';
    final url2 = '${XGServiceConfig.baseURL_source1}/recommend/batchUpdate?';

    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    Map<String, dynamic> params1 = {
      'debug': 0,
      'channel': 'ios',
      'imei': '6a49ec3bfcc642a58f29f9a10a26bafd',
      'terminal_model': 'iPhone 11 Pro',
      'timestamp': timestamp,
      'version': '3.1.6',
    };

    Map<String, dynamic> params2 = {
      'category_id': 50,
      'channel': 'ios',
      'imei': '6a49ec3bfcc642a58f29f9a10a26bafd',
      'terminal_model': 'iPhone 11 Pro',
      'timestamp': timestamp,
      'version': '3.1.6',
    };

    List recommendList = await HttpRequest.request(url1, params: params1, headers: XGServiceConfig.headers);
    final result = await HttpRequest.request(url2, params: params2, headers: XGServiceConfig.headers);

    if (result != null) {
      recommendList.add(result['data']);
    }

    return XGFloorModel.fromList(recommendList);
  }

  Future<XGFloorModel> parseHtmlData() async {
    print('++++开始解析数据++++');
    final htmlUrl = 'https://m.happymh.com';
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

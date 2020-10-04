import 'package:html/parser.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGDetailRequest {
  static Future<XGDetailModel> requestDetailInfo(int comicsId) async {
    final url = '${XGServiceConfig.baseURL_source1}comic/comic_$comicsId.json?';
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    Map<String, dynamic> params = {
      'channel': 'ios',
      'imei': '6a49ec3bfcc642a58f29f9a10a26bafd',
      'terminal_model': 'iPhone 11 Pro',
      'timestamp': timestamp,
      'version': '3.1.6',
    };

    final result = await HttpRequest.request(url, params: params, headers: XGServiceConfig.headers);

    print('zxd-log: detail >>>>> $result');
    return XGDetailModel.fromJson(result);
  }

  Future<XGDetailModel> parseHtml() async{
    Map<String, dynamic> headers = {
      'Pragma': 'no-cache',
      'Cookie': '_ga=GA1.2.731660466.1601693822; _gid=GA1.2.1486212030.1601693822; Hm_lpvt_41c11edf5dd2000ce3e9a84e746d3ca3=1601734569; Hm_lvt_41c11edf5dd2000ce3e9a84e746d3ca3=1601693824; PHPSESSID=20fjrsjb5jsp5h9gdsg1pp4ofm',
      'Referer': 'https://m.happymh.com/',
      'Cache-Control': 'no-cache',
      'Host': 'm.happymh.com',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept-Language': 'zh-cn',
      'Connection': 'keep-alive',
    };

    final response = await HttpRequest.request('', headers: headers);
    final document = parse(response);
    return XGDetailModel.fromDocument(document);
  }
}
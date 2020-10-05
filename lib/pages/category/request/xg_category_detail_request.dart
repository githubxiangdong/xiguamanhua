import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGCategoryDetailRequest {
  static Future<List<XGComicsModel>> requestCategoryDetailList(int categoryId, int index) async {
    final url = '${XGServiceConfig.baseURL_source1}classify/$categoryId/0/$index.json?';
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    Map<String, dynamic> params = {
      'channel': 'ios',
      'imei': '6a49ec3bfcc642a58f29f9a10a26bafd',
      'terminal_model': 'iPhone 11 Pro',
      'timestamp': timestamp,
      'version': '3.1.6',
    };

    final result = await HttpRequest.request(url, params: params, headers: XGServiceConfig.headers);

    print('zxd-log: categoryDetailRequest >>>>> $result');

    List<XGComicsModel> models = [];
    for (var json in result) {
      models.add(XGComicsModel.fromJson(json));
    }

    return models;
  }
}
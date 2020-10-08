import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';
import 'package:xiguamanhua/service/http_request.dart';

class XGRecommendBannerRequest {
  static Future<List<XGComicsModel>> requestBannerList() async {
    final url = '${XGServiceConfig.baseURL_source1}classify/8/0/0.json?';
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    Map<String, dynamic> params = {
      'channel': 'ios',
      'imei': '6a49ec3bfcc642a58f29f9a10a26bafd',
      'terminal_model': 'iPhone 11 Pro',
      'timestamp': timestamp,
      'version': '3.1.6',
    };

    final result = await HttpRequest.request(url, params: params, headers: XGServiceConfig.headers);

    print('zxd-log: categoryDetailRequest0 >>>>> $result');

    List<XGComicsModel> models = [];
    for (var json in result) {
      models.add(XGComicsModel.fromJson(json));
    }

    int endIndex = 8;
    if (models.length < 8) {
      endIndex = models.length;
    }
    models = models.sublist(0, endIndex);

    print('zxd-log: categoryDetailRequest1 >>>>> ${models.toString()}');
    return models;
  }
}
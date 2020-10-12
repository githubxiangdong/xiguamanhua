import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGSearchResultRequest {
  static Future<List<XGComicsModel>> requestResultList(String text, int index) async {
    final url = '${XGServiceConfig.baseURL_source1}search/show/0/$text/$index.json?';

    final result = await HttpRequest.request(
      url,
      params: XGServiceConfig.params,
      headers: XGServiceConfig.headers,
    );

    List<XGComicsModel> comicsList = [];
    for (var json in result) {
      comicsList.add(XGComicsModel.fromJson(json));
    }
    print('zxd-log: requestResultList >>>>> $result');
    return comicsList;
  }
}

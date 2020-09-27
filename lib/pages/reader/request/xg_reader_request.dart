import 'package:xiguamanhua/pages/reader/model/xg_reader_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGReaderRequest {
  static Future<XGReaderModel> requestReaderList(int comicsId, int chapterId) async {
    final url = '${XGServiceConfig.baseURL_source1}/chapter/$comicsId/$chapterId.json';
    final result = await HttpRequest.request(url);
    return XGReaderModel.fromJson(result);
  }
}
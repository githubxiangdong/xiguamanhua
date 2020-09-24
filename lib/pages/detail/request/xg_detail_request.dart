import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGDetailRequest {
  static Future<XGDetailModel> requestDetailInfo(int manHuaId) async {
    final url = '${XGServiceConfig.baseURL_source1}comic/comic_$manHuaId.json';
    final result = await HttpRequest.request(url);
    return XGDetailModel.fromJson(result);
  }
}
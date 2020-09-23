import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGDetailRequest {
  static void requestDetailInfo(int manHuaId) async {
    final url = '${XGServiceConfig.baseURL_source1}comic/comic_$manHuaId.json';
    final result = await HttpRequest.request(url);
    print('zxd-log url $url');
    print('zxd-log$result');
  }
}
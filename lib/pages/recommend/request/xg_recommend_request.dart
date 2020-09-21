import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGRecommendRequest {
  static Future<List<XGRecommendModel>> requestRecommendList() async {
    // 1. 构建url
    final url = '${XGServiceConfig.baseURL_source1}/recommend_index_ios.json';

    // 2. 发送网络请求，获取数据
    final result = await HttpRequest.request(url);

    // 3. 将数据json转换成model, 将二维数组转换成一维数组
    List<XGRecommendModel> recommends = [];
    for (var dic in result) {
      List dataList = dic['data'];
      for (int i = 0; i < dataList.length; i++) {
        final json = dataList[i];
        XGRecommendModel model = XGRecommendModel();
        
        if (i == 0) {
          model.categoryId = dic['category_id'];
          model.title = dic['title'] == null ? '其他' : dic['title'];
          model.sort = dic['sort'];
        }
        model.cover = json['cover'];
        model.titleName = json['title'];
        model.subTitle = json['sub_title'];
        model.type = json['type'];
        model.url = json['url'];
        model.objId = json['obj_id'];
        model.status = json['status'];

        recommends.add(model);
      }
    }

    print('zxd-log: ${recommends.toString()}');
    return recommends;
  }
}
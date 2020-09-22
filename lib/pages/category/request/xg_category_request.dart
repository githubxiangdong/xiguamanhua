import 'package:xiguamanhua/pages/category/model/xg_category_model.dart';
import 'package:xiguamanhua/service/http_request.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class XGCategoryRequest {
		static Future<List<XGCategoryModel>> requestCategoryList() async {
				// 1. 构建url
				final url = '${XGServiceConfig.baseURL_source1}0/category.json';
				// 2. 发送网络请求
				final result = await HttpRequest.request(url);
				// 3. 解析数据
				List<XGCategoryModel> categories = [];
				
				for (var dic in result) {
					categories.add(XGCategoryModel.fromJson(dic));
				}

				return categories;
		}
}
import 'package:dio/dio.dart';
import 'package:xiguamanhua/service/xg_service_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    connectTimeout: XGServiceConfig.timeout,
  );

  static final Dio dio = Dio(baseOptions);

  // { }命名可选参数方式
  static Future<T> request<T>(
    String url, {
    String method = 'get',
    Map<String, dynamic> params,
    Interceptor inter,
    Map<String, dynamic> headers,
  }) async {
    // 1. 创建单独配置
    final options = Options(method: method, headers: headers);

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(onRequest: (options) {
      print('zxd-log: 请求拦截');
      return options;
    }, onResponse: (response) {
      print('zxd-log: 响应拦截');
      return response;
    }, onError: (err) {
      print('zxd-log: 错误拦截');
      return err;
    });
    List<Interceptor> inters = [dInter];

    // 请求拦截器添加
    if (inters != null) {
      inters.add(dInter);
    }

    dio.interceptors.addAll(inters);

    // 2. 发送网楼请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }
}

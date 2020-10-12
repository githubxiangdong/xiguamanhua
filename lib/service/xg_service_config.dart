class XGServiceConfig {
  static const String baseURL_source1 = 'http://nnv3api.dmzj1.com/';

  static const int timeout = 10000;

  static Map<String, dynamic> headers = {
    'Host': 'nnv3api.dmzj1.com',
    'Accept': '*/*',
    'Cookie': 'KLBRSID=f123b361528bb1c8d7904ade24db5bce|1601775176|1601774875',
    'User-Agent': 'dong man zhi jiaPro/3.1.6 (iPhone; iOS 13.7; Scale/3.00)',
    'Accept-Language': 'zh-Hans-CN;q=1',
    'Accept-Encoding': 'gzip, deflate',
    'Connection': 'keep-alive',
  };

  static final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  static Map<String, dynamic> params = {
    'channel': 'ios',
    'imei': '6a49ec3bfcc642a58f29f9a10a26bafd',
    'terminal_model': 'iPhone 11 Pro',
    'timestamp': timestamp,
    'version': '3.1.6',
  };
}
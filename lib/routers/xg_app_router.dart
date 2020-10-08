import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/pages/category/page/xg_category_detail_page.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';
import 'package:xiguamanhua/pages/main/page/xg_main_page.dart';
import 'package:xiguamanhua/pages/reader/page/xg_reader_page.dart';
import 'package:xiguamanhua/pages/search/page/xg_search_page.dart';

class XGAPPRouter {
  // 默认加载页面为homepage页
  static final String initialRoute = XGMainPage.routeName;
  // 路由配置
  static final Map<String, WidgetBuilder> routers = {
    XGMainPage.routeName: (context) => XGMainPage(),
    XGSearchPage.routeName: (context) => XGSearchPage(),
  };
	
  static final RouteFactory onGenerateRoute = (settings) {
    if (settings.name == XGDetailPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        return XGDetailPage(settings.arguments as XGComicsModel);
      });
    }
		
    if (settings.name == XGReaderPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        List argumentsArr = settings.arguments as List;
        if (argumentsArr.length == 3) {
          return XGReaderPage(argumentsArr[0], argumentsArr[1], argumentsArr[2]);
        }
        return null;
      });
    }

    if (settings.name == XGCategoryDetailPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        List argumentsArr = settings.arguments as List;
        if (argumentsArr.length == 2) {
          return XGCategoryDetailPage(argumentsArr[0], argumentsArr[1]);
        }
        return null;
      });
    }

    return null;
  };
}

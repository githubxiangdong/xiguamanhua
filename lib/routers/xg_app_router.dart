import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/main/page/xg_main_page.dart';

class XGAPPRouter {
	// 默认加载页面为homepage页
	static final String initialRoute = XGMainPage.routeName;
	
	// 路由配置
	static final Map<String, WidgetBuilder> routers = {
			XGMainPage.routeName: (context) => XGMainPage(),
	};
}
import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/home/page/xg_home_page.dart';
import 'package:xiguamanhua/pages/setting/page/xg_setting_page.dart';
import 'package:xiguamanhua/pages/shujia/page/xg_shujia_page.dart';
import 'package:xiguamanhua/pages/video/page/xg_video_page.dart';

List<Widget> appPages = [
		XGHomePage(),
		XGVideoPage(),
		XGShuJiaPage(),
		XGSettingPage(),
];

List<BottomNavigationBarItem> bottomBarItems = [
		BottomNavigationBarItem(
				icon: Icon(Icons.home),
				title: Text('首页'),
		),
		BottomNavigationBarItem(
				icon: Icon(Icons.home),
				title: Text('动漫'),
		),
		BottomNavigationBarItem(
				icon: Icon(Icons.home),
				title: Text('书架'),
		),
		BottomNavigationBarItem(
				icon: Icon(Icons.home),
				title: Text('设置'),
		),
];
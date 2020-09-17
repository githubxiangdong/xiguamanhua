import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/home/page/xg_home_page.dart';
import 'package:xiguamanhua/pages/main/page/xg_tabbar_item.dart';
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
  XGBottomBarItem('首页', 'home'),
  XGBottomBarItem('动漫', 'video'),
  XGBottomBarItem('书架', 'shujia'),
  XGBottomBarItem('设置', 'setting'),
];

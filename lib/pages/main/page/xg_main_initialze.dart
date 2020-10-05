import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/category/page/xg_category_page.dart';
import 'package:xiguamanhua/pages/home/page/xg_home_page.dart';
import 'package:xiguamanhua/pages/main/page/xg_tabbar_item.dart';
import 'package:xiguamanhua/pages/setting/page/xg_setting_page.dart';
import 'package:xiguamanhua/pages/shujia/page/xg_shujia_page.dart';

List<Widget> appPages = [
  XGHomePage(),
  XGCategoryPage(),
  XGShuJiaPage(),
  XGSettingPage(),
];

List<BottomNavigationBarItem> bottomBarItems = [
  XGBottomBarItem('首页', 'home'),
  XGBottomBarItem('分类', 'category'),
  XGBottomBarItem('书架', 'shujia'),
  XGBottomBarItem('设置', 'setting'),
];

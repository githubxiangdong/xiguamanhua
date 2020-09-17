import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/home/page/xg_home_page.dart';
import 'package:xiguamanhua/pages/setting/page/xg_setting_page.dart';
import 'package:xiguamanhua/pages/shujia/page/xg_shujia_page.dart';
import 'package:xiguamanhua/pages/video/page/xg_video_page.dart';

class XGMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: <Widget>[
          XGHomePage(),
          XGVideoPage(),
          XGShuJiaPage(),
          XGSettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // items: ,
      ),
    );
  }
}

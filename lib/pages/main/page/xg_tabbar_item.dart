import 'package:flutter/material.dart';

class XGBottomBarItem extends BottomNavigationBarItem {
  XGBottomBarItem(String title, String iconName)
      : super(
          icon: Image.asset(
            'assets/images/tabbar/xg_tabbar_$iconName.png',
            width: 26,
            gaplessPlayback: true,
          ),
          activeIcon: Image.asset(
            'assets/images/tabbar/xg_tabbar_${iconName}_active.png',
            width: 26,
            gaplessPlayback: true,
          ),
          title: Text(title),
        );
}

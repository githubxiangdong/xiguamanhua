import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/main/page/xg_main_initialze.dart';

class XGMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: appPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: bottomBarItems,
      ),
    );
  }
}

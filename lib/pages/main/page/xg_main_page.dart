import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/main/page/xg_main_initialze.dart';

class XGMainPage extends StatefulWidget {
  @override
  _XGMainPageState createState() => _XGMainPageState();
}

class _XGMainPageState extends State<XGMainPage> {
  int _currentIndex = 0;

  void _onChangeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: appPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Color.fromRGBO(180, 180, 180, 1),
        type: BottomNavigationBarType.fixed,
        items: bottomBarItems,
        currentIndex: _currentIndex,
        onTap: (index) => _onChangeIndex(index),
      ),
    );
  }
}

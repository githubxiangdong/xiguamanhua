import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/category/page/xg_category_page.dart';
import 'package:xiguamanhua/pages/recommend/page/xg_recommend_page.dart';

class XGHomePage extends StatefulWidget {
  static const String routeName = '/XGHomePage';
  @override
  _XGHomePageState createState() => _XGHomePageState();
}

class _XGHomePageState extends State<XGHomePage> {
  int _currentIndex = 0;
  
  /// 推荐
  void _onRecommend() {
    if (_currentIndex == 0) return;
    setState(() {
      _currentIndex = 0;
    });
  }

  /// 分类
  void _onCategory() {
    if (_currentIndex == 1) return;
    setState(() {
      _currentIndex = 1;
    });
  }
  
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildChooseSelector(),
      ),
      body: Container(
        child: _currentIndex == 0 ? XGRecommendPage() : XGCategoryPage(),
      ),
    );
  }

  /// 构建一个选择器
  Widget _buildChooseSelector() {
    return Container(
      height: 28,
      width: (75.0 * 2),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildChooseButton(
            title: '推荐',
            radius: BorderRadius.only(
              topLeft: Radius.circular(11.5),
              bottomLeft: Radius.circular(11.5),
              topRight: _currentIndex == 0 ? Radius.circular(11.5) : Radius.circular(0),
              bottomRight: _currentIndex == 0 ? Radius.circular(11.5) : Radius.circular(0),
            ),
            selected: _currentIndex == 0 ? true : false,
            onPress: () => _onRecommend(),
          ),
          _buildChooseButton(
            title: '分类',
            radius: BorderRadius.only(
              topLeft: _currentIndex == 0 ? Radius.circular(0) : Radius.circular(11.5),
              bottomLeft: _currentIndex == 0 ? Radius.circular(0) : Radius.circular(11.5),
              topRight: Radius.circular(11.5),
              bottomRight: Radius.circular(11.5),
            ),
            selected: _currentIndex == 0 ? false : true,
            onPress: () => _onCategory(),
          ),
        ],
      ),
    );
  }

  /// 构建按钮
  Widget _buildChooseButton({String title, BorderRadius radius, bool selected, Function onPress}) {
    return ButtonTheme(
      height: 23,
      minWidth: 72,
      child: FlatButton(
        color: selected ? Colors.white : Colors.orange,
        child: Text(title, style: TextStyle(color: selected ? Colors.orange : Colors.white)),
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
        onPressed: onPress,
      ),
    );
  }
}

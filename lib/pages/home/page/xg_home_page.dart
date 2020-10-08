import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/recommend/page/xg_recommend_page.dart';
import 'package:xiguamanhua/pages/search/page/xg_search_page.dart';

class XGHomePage extends StatefulWidget {
  static const String routeName = '/XGHomePage';
  @override
  _XGHomePageState createState() => _XGHomePageState();
}

class _XGHomePageState extends State<XGHomePage> {
  ///
  void _gotoSearchPage() {
    Navigator.of(context).pushNamed(XGSearchPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: _buildSearchBar(),
      ),
      body: Container(
        child: XGRecommendPage(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            height: 34,
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            decoration: BoxDecoration(
              color: XGAppTheme.searchBarColor,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          Positioned(
            left: 40,
            top: 7,
            child: Icon(Icons.search, color: XGAppTheme.bodyText1Color, size: 22,),
          ),
          Positioned(
            left: 68,
            top: 7,
            child: Text('搜你想搜的', style: Theme.of(context).textTheme.subtitle1,),
          ),
        ],
      ),
      onTap: () => _gotoSearchPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';

class XGSearchPage extends StatefulWidget {
  static const String routeName = '/XGSearchPage';
  @override
  _XGSearchPageState createState() => _XGSearchPageState();
}

class _XGSearchPageState extends State<XGSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: _buildSearchBar(),
      ),
      body: _buildSearchList(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 44,
      color: Colors.red,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          _buildSearchBarTextFiled(),
        ],
      ),
    );
  }

  Widget _buildSearchBarTextFiled() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 20),
          hintText: '搜你想搜的',
          hintStyle: Theme.of(context).textTheme.subtitle1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: XGAppTheme.searchBarColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: XGAppTheme.searchBarColor),
          ),
          filled: true,
          fillColor: XGAppTheme.searchBarColor,
        ),
      ),
    );
  }

  Widget _buildSearchList() {
    return Container(
      color: Colors.red,
    );
  }
}

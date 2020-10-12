import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/search/request/xg_search_result_request.dart';
import 'package:xiguamanhua/pages/search/widget/xg_search_result_list.dart';
import 'package:xiguamanhua/widgets/xg_back_button.dart';

class XGSearchPage extends StatefulWidget {
  static const String routeName = '/XGSearchPage';

  @override
  _XGSearchPageState createState() => _XGSearchPageState();
}

class _XGSearchPageState extends State<XGSearchPage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();
  List<XGComicsModel> _comicsList = [];

  ///
  void _onSubmitted(String text) {
    print('zxd-log: _searchController2 >>>>> $text');
    XGSearchResultRequest.requestResultList(text, 0).then((rsp) {
      setState(() {
        _comicsList.addAll(rsp);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        leading: XGBackButton.xgBackButton(context),
        title: _buildSearchBar(),
        centerTitle: false,
      ),
      body: _buildSearchContent(),
    );
  }
  
  Widget _buildSearchBar() {
    return Container(
      height: 34,
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        textInputAction: TextInputAction.search,
        autocorrect: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 20),
          hintText: '搜你想搜的',
          hintStyle: Theme.of(context).textTheme.subtitle1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide(color: XGAppTheme.searchBarColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide(color: XGAppTheme.searchBarColor),
          ),
          filled: true,
          fillColor: XGAppTheme.searchBarColor,
        ),
        onSubmitted: (text) => _onSubmitted(text),
      ),
    );
  }
  
  Widget _buildSearchContent() {
    if (_comicsList == null || _comicsList.length <= 0) {
      return Center(
        child: Text('还没有搜索内容，赶快去搜索吧~', style: Theme.of(context).textTheme.subtitle2),
      );
    }
    return Container(
      child: XGSearchResultList(_comicsList),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/widgets/xg_back_button.dart';

class XGSearchPage extends StatefulWidget {
  static const String routeName = '/XGSearchPage';

  @override
  _XGSearchPageState createState() => _XGSearchPageState();
}

class _XGSearchPageState extends State<XGSearchPage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();
  
  ///
  void _onSearch() {
    _searchFocusNode.unfocus();
    print('zxd-log: _searchController1 >>>>> ${_searchController.text}');
  }
  
  ///
  void _onTextChanged(String change) {
    
  }

  void _onSubmitted(String text) {
    print('zxd-log: _searchController2 >>>>> $text');
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        leading: XGBackButton.xgBackButton(context),
        title: _buildSearchBar(),
        centerTitle: false,
        actions: [
          _buildSearchButton(),
        ],
      ),
      body: _buildSearchList(),
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
        onChanged: (change) => _onTextChanged(change),
        onSubmitted: (text) => _onSubmitted(text),
      ),
    );
  }
  
  Widget _buildSearchButton() {
    return GestureDetector(
      child: Container(
        color: XGAppTheme.navigationBarColor,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
        child: Text('搜索', style: Theme.of(context).textTheme.subtitle2,),
      ),
      onTap: () => _onSearch(),
    );
  }
  
  Widget _buildSearchList() {
    return Container(
      // color: Colors.red,
    );
  }
}

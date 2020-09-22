import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/category/model/xg_category_model.dart';
import 'package:xiguamanhua/pages/category/request/xg_category_request.dart';

class XGCategoryPage extends StatefulWidget {
  static const String routeName = '/XGCategoryPage';

  @override
  _XGCategoryPageState createState() => _XGCategoryPageState();
}

class _XGCategoryPageState extends State<XGCategoryPage> {
  final List<XGCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();
    // 网络请求
    XGCategoryRequest.requestCategoryList().then((rsp) {
      setState(() {
        _categories.addAll(rsp);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _categories.isNotEmpty ? _categories.length : 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 4,
        childAspectRatio: 0.79,
      ),
      itemBuilder: (ctx, index) {
        return _buildItem(_categories[index]);
      },
    );
  }

  /// 构建item
  Widget _buildItem(XGCategoryModel model) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Column(
        children: [
          _buildItemImage(model),
          _buildItemTitle(model),
        ],
      ),
    );
  }

  /// 构建item图片
  Widget _buildItemImage(XGCategoryModel model) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(model?.cover),
    );
  }

  /// 构建item类型
  Widget _buildItemTitle(XGCategoryModel model) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        model?.title,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

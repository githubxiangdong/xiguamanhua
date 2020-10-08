import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/category/model/xg_category_model.dart';
import 'package:xiguamanhua/pages/category/page/xg_category_detail_page.dart';
import 'package:xiguamanhua/pages/category/request/xg_category_request.dart';

class XGCategoryPage extends StatefulWidget {
  static const String routeName = '/XGCategoryPage';
  @override
  _XGCategoryPageState createState() => _XGCategoryPageState();
}

class _XGCategoryPageState extends State<XGCategoryPage> {
  final List<XGCategoryModel> _categories = [];

  ///
  void _onGoToCategoryDetailPage(int categoryId, String title) {
    Navigator.of(context).pushNamed(XGCategoryDetailPage.routeName, arguments: [categoryId, title]);
  }

  ///
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: Text('分类', style: Theme.of(context).textTheme.headline1),
      ),
      body: _buildItemContent(),
    );
  }
  
  Widget _buildItemContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: GridView.builder(
        itemCount: (_categories == null || _categories.length == 0) ? 0 : _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 4,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (ctx, index) {
          return _buildItem(_categories[index]);
        },
      ),
    );
  }

  /// 构建item
  Widget _buildItem(XGCategoryModel model) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          children: [
            _buildItemImage(model),
            _buildItemTitle(model),
          ],
        ),
      ),
      onTap: () => _onGoToCategoryDetailPage(model.tagId, model.title),
    );
  }

  /// 构建item图片
  Widget _buildItemImage(XGCategoryModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        placeholder: (ctx, url) {
          return Image.asset('assets/images/other/xg_placeholder_img.png');
        },
        imageUrl: model.cover,
        fit: BoxFit.fill,
      ),
    );
  }

  /// 构建item类型
  Widget _buildItemTitle(XGCategoryModel model) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        model.title,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

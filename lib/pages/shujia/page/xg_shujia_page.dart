import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiguamanhua/common/provider/xg_book_rack_provider.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/shujia/widget/xg_shujia_item.dart';

class XGShuJiaPage extends StatefulWidget {
  static const String routeName = '/XGShuJiaPage';

  @override
  _XGShuJiaPageState createState() => _XGShuJiaPageState();
}

class _XGShuJiaPageState extends State<XGShuJiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XGAppTheme.navigationBarColor,
        title: Text(
          '书架',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Consumer<XGBookRackProvider>(
      builder: (ctx, provider, child) {
        if (provider.comicsModels.length == 0) {
          return Center(
            child: Text('您还没有收藏漫画，赶快去收藏哦~', style: Theme.of(context).textTheme.subtitle2,),
          );
        }
        return Container(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 0,
              childAspectRatio: 0.64,
            ),
            itemBuilder: (ctx, index) {
              return XGShuJiaItem(provider.comicsModels[index]);
            },
            itemCount: provider.comicsModels.length,
          ),
        );
      },
    );
  }
}

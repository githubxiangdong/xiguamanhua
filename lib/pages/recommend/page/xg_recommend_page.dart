import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:xiguamanhua/pages/recommend/request/xg_recommend_request.dart';

class XGRecommendPage extends StatefulWidget {
  static const String routeName = '/XGRecommendPage';

  @override
  _XGRecommendPageState createState() => _XGRecommendPageState();
}

class _XGRecommendPageState extends State<XGRecommendPage> {
  final List<XGRecommendModel> _recommendModels = [];

  ///
  @override
  void initState() {
    super.initState();
    // 发送网络请求
    XGRecommendRequest.requestRecommendList().then((rsp) {
      setState(() {
        _recommendModels.addAll(rsp);
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        itemCount: _recommendModels.isNotEmpty ? _recommendModels.length : 0,
        itemBuilder: (context, index) {
          return Container(
            child: _buildItem(),
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(1, 1.2);
        },
      ),
    );
  }

  /// 创建图片item
  Widget _buildItem() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          _buildItemImage(),
          _buildItemDescribeText(),
        ],
      ),
    );
  }

  /// 图片
  Widget _buildItemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        'https://images.dmzj1.com/tuijian/320_170/200529xinman86.jpg',
        height: 140,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  /// 描述内容
  Widget _buildItemDescribeText() {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('我是标题', style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(width: 10,),
              Text('(连载中...)'),
            ],
          ),
          Text('我是描述标题'),
        ],
      ),
    );
  }
}

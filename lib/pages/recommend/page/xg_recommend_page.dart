import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:xiguamanhua/pages/recommend/request/xg_recommend_request.dart';
import 'package:xiguamanhua/widgets/list_view_group.dart';

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
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      padding: const EdgeInsets.all(4.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.orange,
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(1, 1.5);
      },
    );
  }

  Widget _buildContainer() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      height: 230,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          _buildImage(),
          _buildDescribeContainer(),
        ],
      ),
    );
  }

  /// 图片
  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://images.dmzj1.com/tuijian/320_170/200529xinman86.jpg',
        height: 180,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  /// 描述内容
  Widget _buildDescribeContainer() {
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

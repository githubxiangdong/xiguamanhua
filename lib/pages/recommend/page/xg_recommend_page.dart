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
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        itemCount: _recommendModels.isNotEmpty ? _recommendModels.length : 0,
        itemBuilder: (context, index) {
          if (_recommendModels[index].title != null) {
            return _buildSectionHeader(_recommendModels[index].title);
          } else {
            return _buildItem(_recommendModels[index]);
          }
        },
        staggeredTileBuilder: (int index) {
          if (_recommendModels[index].title != null) {
            return StaggeredTile.count(3, 0.4);
          } else {
            return StaggeredTile.count(1, 1.4);
          }
        },
      ),
    );
  }

  /// 创建组头
  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Row(
        children: [
          Container(color: Colors.orange, width: 4, height: 14),
          SizedBox(width: 5),
          Text(title, style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }

  /// 创建图片item
  Widget _buildItem(XGRecommendModel model) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          _buildItemImage(model),
          _buildItemDescribeText(model),
        ],
      ),
    );
  }

  /// 图片
  Widget _buildItemImage(XGRecommendModel model) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(model?.cover, fit: BoxFit.fill),
      ),
    );
  }

  /// 描述内容
  Widget _buildItemDescribeText(XGRecommendModel model) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 7, 8, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  model.titleName,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ),
              SizedBox(width: 10),
              Text('(${model.status})'),
            ],
          ),
          SizedBox(height: 1),
          Text(model.subTitle, maxLines: 1),
        ],
      ),
    );
  }
}

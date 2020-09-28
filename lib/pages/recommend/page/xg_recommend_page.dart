import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';
import 'package:xiguamanhua/pages/recommend/model/xg_recommend_model.dart';
import 'package:html/parser.dart';
import 'package:xiguamanhua/pages/recommend/request/xg_recommend_request.dart';

class XGRecommendPage extends StatefulWidget {
  static const String routeName = '/XGRecommendPage';

  @override
  _XGRecommendPageState createState() => _XGRecommendPageState();
}

class _XGRecommendPageState extends State<XGRecommendPage> {
  final List<XGRecommendModel> _recommendModels = [];

  /// 点击事件
  void _onGoToDetailPage(int objId) {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: objId);
  }
  
  ///
  @override
  void initState() {
    super.initState();
    // 发送网络请求
    // XGRecommendRequest.requestRecommendList().then((rsp) {
    //   setState(() {
    //     _recommendModels.addAll(rsp);
    //   });
    // });

    gethttp();
  }

  void gethttp() async {
//  var body = "<html><head><title>80页笔记看遍机器学习基本概念、算法、模型，帮新手少走弯路</title></head> <body></body></html>>";
    
    //请求HTML数据
    final url = 'https://m.gufengmh8.com';
    var response = await Dio().get(url);
    //解析返回的数据，类似 val doc = Jsoup.connect(text).get()
    var document = parse(response.data);
    final responseString = document.outerHtml;
    // print('zxd-log: +++1 $responseString');
    
    // final index = responseString.indexOf('<ul class="nav autoHeight');
    // print('zxd-log: +++2 $index');
    // final bodyString = responseString.substring(index);
    // print('zxd-log: +++3 $bodyString');
    
    var bodyList = document.getElementsByTagName('body');
    for (var body in bodyList) {
      var ulList = body.getElementsByTagName('ul');
      for (var ul in ulList) {
        var ulHtml = ul.outerHtml;
        print('zxd-log +++2: $ulHtml');
        print('zxd-log +++3: ${ul.getElementsByClassName('nav autoHeight')}');
        var liList = ul.getElementsByTagName('li');
        // print('zxd-log +++4: ${liList.toString()}');
        for (var li in liList) {
          // print('zxd-log +++5: ${li.text}');
        }
      }
    }
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
          Container(
            width: 4.3,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 5),
          Text(title, style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }

  /// 创建item
  Widget _buildItem(XGRecommendModel model) {
    return GestureDetector(
      child: Container(
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
      ),
      onTap: () =>_onGoToDetailPage(model?.objId),
    );
  }

  /// 创建item图片
  Widget _buildItemImage(XGRecommendModel model) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(model?.cover, fit: BoxFit.fill),
      ),
    );
  }

  /// 创建item描述内容
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
                  model?.titleName,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ),
              SizedBox(width: 10),
              Text('(${model?.status})'),
            ],
          ),
          SizedBox(height: 1),
          // Text(model?.subTitle, maxLines: 1),
        ],
      ),
    );
  }
}

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
    final url = 'https://m.gufengmh8.com'; //'http://www.gugu5.com'; // https://m.gufengmh8.com
    var response = await Dio().get(url);
    var result = json.decode(response.data);
    print('zxd-log: +++1 $response');
    //解析返回的数据，类似 val doc = Jsoup.connect(text).get()
    var document = parse(response.data);
    print('zxd-log: +++2 $document');
    
    //获取html标签，类似val links = doc.select("title")
    var title = document.querySelector("title");
    print('zxd-log: +++3 ${title.text}');
    
    //获取html body标签，类似 val body = doc.getElementsByTag("body")
    var body = document.getElementsByTagName("body");
    print('zxd-log: +++4 ${body.toList()}');
    
    //下面获取html的图片，暂未找到好的解决办法，使用的最笨的截取
    var scripts = body[0].getElementsByTagName("script");
    print('zxd-log: +++5 $scripts');
    
    for(int i=0;i< scripts.length;i++){
      //将获取的html标签转换成String字符串
      var script = scripts[i].outerHtml.toString();
      // print('zxd-log: +++6 $script');
      //判断字符串是否包含BASE_DATA
      if (script.indexOf("BASE_DATA") != -1) {
        //处理得到image图片
        var image = script.substring(script.indexOf("coverImg"), script.indexOf("commentInfo:"))
            .replaceAll("coverImg:", "").replaceAll("\'", "").replaceAll("},", "");
        
        print('zxd-log: +++7 $image');
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

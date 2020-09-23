
import 'package:flutter/material.dart';

class XGDetailPage extends StatefulWidget {
  static const String routeName = '/XGDetailPage';

  @override
  _XGDetailPageState createState() => _XGDetailPageState();
}

class _XGDetailPageState extends State<XGDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('漫画标题'),
      ),
      body: _buildDetailLayout(),
    );
  }
  
  /// 创建详情布局
  Widget _buildDetailLayout() {
    return CustomScrollView(
      slivers: [
        _buildDetailHeader(),
        _buildContentNavigate(),
      ],
    );
  }
  
  /// 创建详情头部
  Widget _buildDetailHeader() {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        color: Colors.grey,
      ),
    );
  }
  
  /// 创建内容导航
  Widget _buildContentNavigate() {
    return SliverToBoxAdapter(
      child: Container(
        height: 49,
        color: Colors.orange,
      ),
    );
  }
}

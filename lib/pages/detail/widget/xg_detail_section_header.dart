import 'package:flutter/material.dart';

class XGDetailSectionHeader extends StatefulWidget {
  final String title;
  XGDetailSectionHeader(this.title);
  @override
  _XGDetailSectionHeaderState createState() => _XGDetailSectionHeaderState();
}

class _XGDetailSectionHeaderState extends State<XGDetailSectionHeader> {
  @override
  Widget build(BuildContext context) {
    return _buildSectionHeader();
  }

  /// 创建导航
  Widget _buildSectionHeader() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        height: 38,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color.fromRGBO(240, 240, 240, 1)),
          ),
        ),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

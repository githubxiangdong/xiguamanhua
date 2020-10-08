import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';

class XGRecommendSectionHeader extends StatefulWidget {
  final title;
  XGRecommendSectionHeader(this.title);
  @override
  _XGRecommendSectionHeaderState createState() => _XGRecommendSectionHeaderState();
}

class _XGRecommendSectionHeaderState extends State<XGRecommendSectionHeader> {
  @override
  Widget build(BuildContext context) {
    return _buildSectionHeader();
  }

  Widget _buildSectionHeader() {
    return SliverToBoxAdapter(
      child: Container(
        height: 38,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 14,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            SizedBox(width: 3),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

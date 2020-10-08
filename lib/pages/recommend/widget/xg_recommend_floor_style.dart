import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/recommend/widget/xg_recommend_item.dart';

enum XGRecommendFloorStyle {
  floor_style_1, // horizontal direction 3 cell and height > width
  floor_style_2, // horizontal direction 2 cell and height < width
}

class XGRecommendFloorStyle1 extends StatefulWidget {
  final comicsList;
  final XGRecommendFloorStyle style;
  XGRecommendFloorStyle1(this.comicsList, this.style);

  @override
  _XGRecommendFloorStyle1State createState() => _XGRecommendFloorStyle1State();
}

class _XGRecommendFloorStyle1State extends State<XGRecommendFloorStyle1> {
  var crossAxisCount = 3;
  var mainAxisSpacing = 8.0;
  var crossAxisSpacing = 8.0;
  var childAspectRatio = 0.6;
  var imageAspectRatio = 0.72;

  @override
  Widget build(BuildContext context) {
    return _buildFloorStyle1();
  }

  Widget _buildFloorStyle1() {
    if (widget.style == XGRecommendFloorStyle.floor_style_1) {
      crossAxisCount = 3;
      mainAxisSpacing = 8.0;
      crossAxisSpacing = 8.0;
      childAspectRatio = 0.6;
      imageAspectRatio = 0.75;
    }else {
      crossAxisCount = 2;
      mainAxisSpacing = 10.0;
      crossAxisSpacing = 10.0;
      childAspectRatio = 1.35;
      imageAspectRatio = 1.85;
    }

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      delegate: SliverChildBuilderDelegate(
            (ctx, index) {
          return XGRecommendItem(widget.comicsList[index], imageAspectRatio);
        },
        childCount: widget.comicsList.length,
      ),
    );
  }
}

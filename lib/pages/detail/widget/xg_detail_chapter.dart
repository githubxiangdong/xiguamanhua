import 'package:flutter/material.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/pages/reader/page/xg_reader_page.dart';

class XGDetailChapter extends StatefulWidget {
  final XGDetailModel detailModel;
  XGDetailChapter(this.detailModel);

  @override
  _XGDetailChapterState createState() => _XGDetailChapterState();
}

class _XGDetailChapterState extends State<XGDetailChapter> {
  ///
  void _onGoToReaderPage(int chapterId) {
    Navigator.of(context).pushNamed(
      XGReaderPage.routeName,
      arguments: [widget.detailModel.comicsId, chapterId, widget.detailModel.comicsName],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChapter();
  }

  /// 创建章节
  Widget _buildChapter() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (ctx, index) {
          return _buildChapterItem(widget.detailModel.chapters[index]);
        },
        childCount: ((widget.detailModel != null || widget.detailModel.chapters.isNotEmpty) ? widget.detailModel.chapters.length : 0),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.8,
      ),
    );
  }

  /// 创建章节item
  Widget _buildChapterItem(XGChapterModel model) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: Color.fromRGBO(220, 220, 220, 1)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(model.chapterTitle),
      ),
      onTap: () => _onGoToReaderPage(model.chapterId),
    );
  }
}

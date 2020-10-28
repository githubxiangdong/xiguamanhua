import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/provider/xg_book_rack_provider.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/detail/model/xg_detail_model.dart';
import 'package:xiguamanhua/pages/reader/page/xg_reader_page.dart';

class XGDetailBottomSheet extends StatefulWidget {
  final XGComicsModel comicsModel;
  final XGDetailModel detailModel;

  XGDetailBottomSheet(this.comicsModel, this.detailModel);

  @override
  _XGDetailBottomSheetState createState() => _XGDetailBottomSheetState();
}

class _XGDetailBottomSheetState extends State<XGDetailBottomSheet> {
  /// 加入书架
  void _onAddBookRack(XGBookRackProvider provider) {
    // 先替换下原始的图片，因为comics中的图片有可能是扁的
    widget.comicsModel.comicsCover = widget.detailModel.comicsCover;
    provider.handleComicsStatus(widget.comicsModel);
  }

  /// 开始阅读
  void _onReadBook() {
    if (widget.detailModel.chapters != null && widget.detailModel.chapters.length > 0) {
      Navigator.of(context).pushNamed(
        XGReaderPage.routeName,
        arguments: [
          widget.detailModel.comicsId,
          widget.detailModel.chapters.last.chapterId,
          widget.detailModel.comicsName,
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomBar();
  }

  Widget _buildBottomBar() {
    return Container(
      height: 44.0 + 38.0,
      alignment: Alignment.topCenter,
      color: XGAppTheme.tabBarColor,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCollect(),
          _buildReader(),
        ],
      ),
    );
  }

  Widget _buildCollect(){
    return Consumer<XGBookRackProvider>(
      builder: (ctx, bookRackProvider, child) {
        return  _buildConsumer(ctx, bookRackProvider, child);
      },
    );
  }

  Widget _buildConsumer(BuildContext ctx, XGBookRackProvider bookRackProvider, Widget child) {
    // 判断状态
    final iconData = bookRackProvider.isAddBookRack(widget.comicsModel) ? Icons.favorite : Icons.favorite_border;
    final iconColor = bookRackProvider.isAddBookRack(widget.comicsModel) ? Colors.orange : XGAppTheme.subtitle2Color;
    final textColor = iconColor;

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 44,
        color: XGAppTheme.tabBarColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, color: iconColor, size: 30),
            SizedBox(width: 5),
            Text('加入书架', style: Theme.of(context).textTheme.subtitle2.copyWith(color: textColor)),
          ],
        ),
      ),
      onTap: () => _onAddBookRack(bookRackProvider),
    );
  }

  Widget _buildReader() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
        height: 34,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Text(
          '开始阅读',
          style: Theme.of(context).textTheme.subtitle2.copyWith(color: XGAppTheme.white_240_Color),
        ),
      ),
      onTap: () => _onReadBook(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';

class XGDetailBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBottomBar();
  }

  Widget _buildBottomBar() {
    return Container(
      height: 44.0 + 38.0,
      alignment: Alignment.topCenter,
      color: XGAppTheme.white_240_Color,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildCollect(),
        _buildReader(),
      ],
    );
  }

  Widget _buildCollect() {
    return Container(
      alignment: Alignment.center,
      height: 44,
      color: Colors.orange,
      child: Text('加入书架'),
    );
  }

  Widget _buildReader() {
    return Container(
      alignment: Alignment.center,
      height: 44,
      color: Colors.orange,
      child: Text('开始阅读'),
    );
  }
}

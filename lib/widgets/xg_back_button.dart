import 'package:flutter/material.dart';

class XGBackButton {
  static Widget xgBackButton(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        'assets/images/other/xg_back.png',
        scale: 9,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}

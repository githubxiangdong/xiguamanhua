import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';

class XGBookRackProvider extends ChangeNotifier{
  List<XGComicsModel> _comicsModels = [];

  List<XGComicsModel> get comicsModels {
    return _comicsModels;
  }

  /// 添加
  void addComics(XGComicsModel model) {
    _comicsModels.add(model);
    notifyListeners();
  }

  /// 删除
  void removeComics(XGComicsModel model) {
    _comicsModels.remove(model);
    notifyListeners();
  }

  /// 是否在书架上
  bool isAddBookRack(XGComicsModel model) {
    return _comicsModels.contains(model);
  }

  /// 统一处理
  void handleComicsStatus(XGComicsModel model) {
    if (isAddBookRack(model)) {
      removeComics(model);
    }else {
      addComics(model);
    }
  }
}
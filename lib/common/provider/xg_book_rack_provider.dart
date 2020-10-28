import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/widgets/xg_store_util.dart';

class XGBookRackProvider extends ChangeNotifier{
  List<XGComicsModel> _comicsModels = [];

  List<XGComicsModel> get comicsModels {
    print('zxd-log: 获取数据总数：${_comicsModels.length}');
    return _comicsModels;
  }

  /**
   * flutter 中的单例写法
   */
  /// 工厂方法
  factory XGBookRackProvider() {
    return _instance;
  }
  /// 初始化一个实例
  static final XGBookRackProvider _instance = XGBookRackProvider._internal();
  /// 函数的重定向，调用XGStoreUtil() 其实就会走到 _internal()
  XGBookRackProvider._internal();


  /// 添加
  void addComics(XGComicsModel model) {
    XGStoreUtil().addComicsModel(model).then((rsp) {
      if (rsp != -1) {
        print('zxd-log: 添加结果 >>>>>：$rsp');
        _comicsModels.add(model);
        print('zxd-log: 添加后 个数 >>>>>：${_comicsModels.length}');
        notifyListeners();
      }
    });
  }

  /// 删除
  void removeComics(XGComicsModel model) {
    XGStoreUtil().deleteComicsModel(model.comicsId).then((rsp) {
      print('zxd-log: 删除结果 >>>>>：$rsp');
      for(var m in _comicsModels) {
        if (m.comicsId == model.comicsId) {
          _comicsModels.remove(model);
          break;
        }
      }
      print('zxd-log: 删除后的 个数 >>>>>：${_comicsModels.length}');
      notifyListeners();
    });
  }

  /// 获取加入书架的数据
  Future<void> getAllComics() async {
    final result = await XGStoreUtil().getAllComicsModels();
    _comicsModels.addAll(result);
    print('zxd-log: 书架总数：${result.length}');
  }

  /// 是否在书架上
  bool isAddBookRack(XGComicsModel model) {
    bool isExit = false;
    for(var m in _comicsModels) {
      if (m.comicsId == model.comicsId) {
        isExit = true;
        break;
      }
    }
    return isExit;
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
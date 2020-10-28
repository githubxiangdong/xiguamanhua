import 'package:sqflite/sqflite.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';

class XGStoreUtil {
  /// 数据库名字
  static const xiGuaSQL = 'xi_gua_sql';

  /// 漫画收藏表
  static const comicsCollectTable = 'comicsCollectTable';
  static const columnId = 'columnId';
  static const comicsId = 'comicsId'; // 漫画id
  static const comicsName = 'comicsName'; // 漫画名
  static const authors = 'authors';
  static const comicsProfile = 'comicsProfile'; // 漫画子标题
  static const comicsCover = 'comicsCover'; // 漫画封面图
  static const comicsSort = 'comicsSort'; // 漫画排名
  static const comicsType = 'comicsType'; // 漫画类型
  static const comicsTypes = 'comicsTypes'; // 漫画类型
  static const comicsStatus = 'comicsStatus'; // 漫画状态
  static const comicsUrl = 'comicsUrl'; // 漫画站外链接
  static const comicsDetailUrl = 'comicsDetailUrl'; // 漫画详情链接
  static const lastName = 'lastName'; // 最近更新

  /**
   * flutter 中的单例写法
   */

  /// 工厂方法
  factory XGStoreUtil() {
    return _instance;
  }

  /// 初始化一个实例
  static final XGStoreUtil _instance = XGStoreUtil._internal();

  /// 函数的重定向，调用XGStoreUtil() 其实就会走到 _internal()
  XGStoreUtil._internal();


  /// 声明数据
  Database _database;

  Future<void> initDb() async {
    _database = await openDatabase(xiGuaSQL);
    await _createTable();
  }

  Future<void> _createTable() async {
    String sql = '''
      CREATE TABLE IF NOT EXISTS $comicsCollectTable(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
      $comicsId INTEGER,
      $comicsName TEXT,
      $authors TEXT,
      $comicsProfile TEXT,
      $comicsCover TEXT,
      $comicsType INTEGER,
      $comicsTypes TEXT,
      $comicsStatus TEXT,
      $comicsUrl TEXT,
      $comicsDetailUrl TEXT,
      $lastName TEXT
      )
    ''';
    return await _database.execute(sql);
  }

  /// 增
  Future<int> addComicsModel(XGComicsModel model) async {
    if (null == _database || !_database.isOpen) return -1;

    final result = await getComicsModel(model.comicsId);
    // 如果没找到这个数据，就会重新插入
    if (result == null) {
      print('zxd-log: 添加新元素 >>>>> ${model.comicsId}');
      return await _database.insert(comicsCollectTable, model.toJson());
    }

    print('zxd-log: 重复添加元素 >>>>> ${model.comicsId}');
    return model.comicsId;
  }

  /// 删除 id 表示漫画id
  Future<int> deleteComicsModel(int id) async {
    print('zxd-log: 执行删除 >>>>>：$id');
    return await _database.delete(
      comicsCollectTable,
      where: '$id = ?',
      whereArgs: [id],
    );
  }

  /// 改
  Future<int> updateComicsModel(XGComicsModel model) async {
    return await _database.update(
      comicsCollectTable,
      model.toJson(),
      where: "$columnId = ?",
      whereArgs: [model.comicsId],
    );
  }

  /// 查
  Future<XGComicsModel> getComicsModel(int id) async {
    List<Map> result = await _database.query(
      comicsCollectTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (result.length > 0) {
      return XGComicsModel.fromSql(result.first);
    }
    return null;
  }

  ///
  Future<List<XGComicsModel>> getAllComicsModels() async {
    var result = await _database.query(
      comicsCollectTable,
    );
    List<XGComicsModel> comicsModels = [];
    if (result.length > 0) {
      for (var json in result) {
        comicsModels.add(XGComicsModel.fromSql(json));
      }
    }
    print('zxd-log: 所有数据：>>>>> ${comicsModels.toString()}');
    return comicsModels;
  }

  ///
  Future<int> getCount() async {
    return Sqflite.firstIntValue(
      await _database.rawQuery(
        'SELECT COUNT(*) FROM $comicsCollectTable',
      ),
    );
  }

  Future<void> close() async {
    _database.close();
  }
}

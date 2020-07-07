import 'dart:async';
import 'dart:io';
import 'package:mvp/models/packagesModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


//import 'package:';
class Helper {
  static final Helper _instance = new Helper.internal();

  factory Helper() => _instance;
  final String tableCart = "mvptable";
  final String columnId = "id";
  final String COLUMN_NAME = "name";
  final String COLUMN_DES ='des' ;
  final String COLUMN_DIM ="dim";
  final String COLUMN_IMAGE1 ="image1";
  final String COLUMN_IMAGE2 ="image2";
  final String COLUMN_IMAGE3 ="image3";
  final String COLUMN_WEIGHT ="weight";
  final String COLUMN_NOTES ="notes";

  static Database _db;
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  Helper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
        documentDirectory.path, "mvpdatabase.db"); //home://directory/files/maindb.db

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableCart ($columnId INTEGER PRIMARY KEY,$COLUMN_DES TEXT,$COLUMN_IMAGE1 TEXT,$COLUMN_IMAGE2 TEXT,$COLUMN_IMAGE3 TEXT,$COLUMN_WEIGHT TEXT,$COLUMN_DIM TEXT,$COLUMN_NOTES TEXT,$COLUMN_NAME TEXT)");
  }

    Future<int> saveSqlCart(SqlCart SqlCart) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableCart", SqlCart.toMap());
    return res;
  }
  Future<List<SqlCart>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableCart, columns: [columnId, COLUMN_NAME]);
    List<SqlCart> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(SqlCart.fromMap(maps[i]));
      }
    }
    return employees;
  }

  //Get SqlCarts
  Future<List> getAllSqlCarts() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableCart");
    return result.toList();
  }
  Future<List<SqlCart>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableCart');
    List<SqlCart> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new SqlCart(list[i]["name"], list[i]["des"], list[i]["dim"], list[i]["image1"], list[i]["image2"], list[i]["image3"], list[i]["weight"], list[i]["notes"]));
    }
    print(employees.length);
    return employees;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    var result = Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableCart"));
    return result;

  }

  Future<SqlCart> getSqlCart(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableCart WHERE $columnId = $id");
    if (result.length == 0) return null;
    return new SqlCart.fromMap(result.first);
  }
  Future<SqlCart> getCart(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableCart WHERE $COLUMN_DIM = $id");
    if (result.length == 0) return null;
    return new SqlCart.fromMap(result.first);
  }

  Future<int> deleteSqlCart(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableCart,
        where: "$columnId= ?", whereArgs: [id]);
  }
  Future<int> SqlAdd(int id) async {
    var dbClient = await db;
    var results = await dbClient.rawQuery("SELECT * FROM $tableCart WHERE $columnId = $id");
    var  qnty=  results[0]['qnty'];
    int t = int.parse(qnty) +1;
    final sql = '''UPDATE ${Helper().tableCart}
    SET ${Helper().COLUMN_DES} = "${t}"
    WHERE ${Helper().columnId} = ${id}
    ''';
    final result = await dbClient.rawUpdate(sql);
    Helper.databaseLog('Update mvpdatabase', sql, null, result);
  }
  Future<int> SqlAddNew(int id) async {
    var dbClient = await db;
    var results = await dbClient.rawQuery("SELECT * FROM $tableCart WHERE $COLUMN_DIM = $id");
    var  qnty=  results[0]['qnty'];
    int t = int.parse(qnty) +1;
    final sql = '''UPDATE ${Helper().tableCart}
    SET ${Helper().COLUMN_DES} = "${t}"
    WHERE ${Helper().columnId} = ${id}
    ''';
    final result = await dbClient.rawUpdate(sql);
    Helper.databaseLog('Update mvpdatabase', sql, null, result);
  }
  Future<int> SqlMinus(int id) async {
    var dbClient = await db;
    var results = await dbClient.rawQuery("SELECT * FROM $tableCart WHERE $columnId = $id");
    var  qnty=  results[0]['qnty'];
    int t = int.parse(qnty)-1;
    final sql = '''UPDATE ${Helper().tableCart}
    SET ${Helper().COLUMN_DES} = "${t}"
    WHERE ${Helper().columnId} = ${id}
    ''';
    final result = await dbClient.rawUpdate(sql);
    Helper.databaseLog('Update mvpdatabase', sql, null, result);
  }

  Future<int> updateSqlCart(SqlCart SqlCart) async {
    var dbClient = await db;
    return await dbClient.update(tableCart,
        SqlCart.toMap(), where: "$columnId = ?", whereArgs: [SqlCart.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
  Future<void> DropTableIfExistsThenReCreate() async {

    //here we get the Database object by calling the openDatabase method
    //which receives the path and onCreate function and all the good stuff
    var ddb = await db;

    //here we execute a query to drop the table if exists which is called "tableName"
    //and could be given as method's input parameter too
    //await ddb.execute("DROP TABLE IF EXISTS cart");

    //and finally here we recreate our beloved "tableName" again which needs
    //some columns initialization
//    await ddb.execute(
//        "CREATE TABLE $tableCart ($columnId INTEGER PRIMARY KEY,$COLUMN_DES TEXT,$COLUMN_DIM TEXT,"
//            "$COLUMN_IMAGE TEXT,"
//            "$COLUMN_PRICE TEXT,"
//            "$COLUMN_PTYPE TEXT,"
//            "$COLUMN_NAME TEXT," ")");
//    // await ddb.execute("CREATE TABLE tableName (id INTEGER, name TEXT)");

  }

}

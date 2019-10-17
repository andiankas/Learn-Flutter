import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;

class DBHelper{
  static final _instance = new DBHelper.internal();
  DBHelper.internal();

  factory DBHelper() => _instance;
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "SimpleNoteDB");
    var dB = await openDatabase(path, version: 1,onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE mynote (id INTEGER PRIMARY KEY, title TEXT, note TEXT, createdAt TEXT, updatedAt TEXT, sortDate TEXT)");
    print("DB CREATED");
  }
}
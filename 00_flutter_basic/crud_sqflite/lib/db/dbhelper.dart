import 'package:crud_sqflite/model/mynote_model.dart';
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

  // insert data
  Future<int> saveNote(MyNote mynote) async {
    var dbClient = await db;
    int res = await dbClient.insert("mynote", mynote.toMap());
    print("Data Inserted");
    return res;
  } 

  // read data
  Future<List<MyNote>> getNote() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM mynote ORDER BY sortdate DESC");
    List<MyNote> notedata = new List();
    for (var i = 0; i < list.length; i++){
      var note = new MyNote(list[i]['title'], list[i]['note'], list[i]['createdAt'], list[i]['updatedAt'], list[i]['sortDate']);
      note.setNoteId(list[i]['id']);
      notedata.add(note);
    }
    return notedata;  
  }
}
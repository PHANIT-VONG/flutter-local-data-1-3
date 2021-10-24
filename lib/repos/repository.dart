import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_data/service/connectionDb.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late ConnectionDb _connectionDb;
  Repository() {
    this._connectionDb = ConnectionDb();
  }
  static Database? _database;
  Future<Database?> get database async {
    //------------- run onlyone -----------------------
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, 'db_name');
    // await deleteDatabase(path);
    // print("here");
    //----------------------------------

    if (_database != null) return _database;
    _database = await _connectionDb.setDatabase();
    return _database;
  }

  insertPeople(table, data) async {
    var _con = await database;
    return await _con!.insert(table, data);
  }

  selectPeople(table) async {
    var _con = await database;
    return await _con!.query(table);
  }

  deletePeople(table, id) async {
    var con = await database;
    return await con!.delete(table, where: "id = ?", whereArgs: [id]);
  }

  updatePeople(table, data, id) async {
    var con = await database;
    return await con!.update(table, data, where: "id= ?", whereArgs: [id]);
  }
}

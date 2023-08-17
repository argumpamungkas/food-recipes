import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  DatabaseManager._();

  static DatabaseManager instance = DatabaseManager._();

  Database? _db;

  Future<Database> get db async {
    _db ??= await initDB();
    return _db!;
  }

  Future initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();

    String path = join(docDir.path, "favourite.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('''CREATE TABLE favourite (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            id_meal TEXT NOT NULL,
            meal_name TEXT NOT NULL,
            meal_thumb TEXT NOT NULL
            )''');
      },
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db?.close();
  }
}

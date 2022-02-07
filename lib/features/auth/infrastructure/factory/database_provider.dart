import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// ignore: avoid_classes_with_only_static_members
class DBProvider {
  static Database? _database;

  static Future<Database> get database async {
    return _database ??= await _initDB();
    //return _database;
  }

  static Future<Database> _initDB() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, "ot.db");
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE users ( '
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'email TEXT, '
          'password TEXT, '
          'client_id TEXT '
          ')',
        );
      },
    );
  }
}

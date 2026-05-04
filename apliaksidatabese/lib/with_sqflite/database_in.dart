import 'dart:io';
import 'produk_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String table = 'contacts';
  Database? _db;

  Future<Database> database() async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'contacts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(''' 
        CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          phone TEXT,
          email TEXT
        )
        ''');
      },
    );
  }

  // POST
  Future<int> insert(ContactModel data) async {
    final db = await database();
    return await db.insert(table, data.toMap());
  }

  // GET
  Future<List<ContactModel>> getAll() async {
    final db = await database();
    final result = await db.query(table);
    return result.map((e) => ContactModel.fromMap(e)).toList();
  }

  // UPDATE
  Future<int> update(ContactModel data) async {
    final db = await database();
    return await db.update(
      table,
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // DELETE
  Future<int> delete(int id) async {
    final db = await database();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}

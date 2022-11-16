import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,category TEXT NOT NULL,description TEXT NOT NULL)");
  }
// id: the id of a item.
// category, description: category and description of the activity to be done.

  static Future<Database> initializeDB() async {
    return openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute("CREATE TABLE IF NOT EXISTS todo(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,category TEXT NOT NULL,description TEXT NOT NULL)");
      },
    );
  }

  // Create new item
  static Future<int> createItem(String category, String? description) async {
    final db = await SQLHelper.initializeDB();

    final data = {'category': category, 'description': description};
    final id = await db.insert('todo', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.initializeDB();
    return db.query('todo', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.initializeDB();
    return db.query('todo', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String category, String? description) async {
    final db = await SQLHelper.initializeDB();

    final data = {
      'category': category,
      'description': description,
    };

    final result =
    await db.update('todo', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.initializeDB();
    try {
      await db.delete("todo", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
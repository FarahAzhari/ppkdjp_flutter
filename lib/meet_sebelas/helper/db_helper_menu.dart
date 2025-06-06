import 'package:path/path.dart';
import 'package:ppkdjp_flutter/meet_sebelas/model/menu_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperMenu {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'menu_restaurant.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE menu(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT NOT NULL, 
            description TEXT, 
            price REAL NOT NULL, 
            category TEXT, 
            image_url TEXT,
            is_available INTEGER DEFAULT 1
            )
        ''');
      },
    );
  }

  /// Fungsi Create Menu Item
  static Future<void> createMenu(MenuModel data) async {
    final db = await initDB();

    await db.insert(
      'menu',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Fungsi Get All Menu Items
  static Future<List<MenuModel>> getAllMenu() async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query('menu');

    return List.generate(data.length, (i) => MenuModel.fromMap(data[i]));
  }

  // Update Menu Item
  // Update Menu Item
  static Future<void> updateMenu(MenuModel data) async {
    final db = await initDB();
    await db.update(
      'menu',
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // // Delete Menu Item
  static Future<void> deleteMenu(int id) async {
    final db = await initDB();
    await db.delete('menu', where: 'id = ?', whereArgs: [id]);
  }
}

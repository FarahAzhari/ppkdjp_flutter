import 'package:path/path.dart';
import 'package:ppkdjp_flutter/meet_16/model/siswa_model.dart';
import 'package:ppkdjp_flutter/meet_16/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      version: 1,
      join(dbPath, 'ppkdjp_flutter.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT, 
            username TEXT, 
            email TEXT, 
            phone TEXT, 
            password TEXT
            )
        ''');
        await db.execute('''
          CREATE TABLE siswa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
        ''');
      },
    );
  }

  /// Fungsi Create User
  static Future<void> registerUser({UserModel? data}) async {
    final db = await initDB();

    await db.insert('users', {
      'name': data?.name,
      'username': data?.username,
      'email': data?.email,
      'phone': data?.phone,
      'password': data?.password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    print('User registered successfully');
  }

  /// Fungsi Read User
  static Future<UserModel?> login(String email, String password) async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (data.isNotEmpty) {
      return UserModel.fromMap(data.first);
    } else {
      return null;
      // throw Exception("Invalid email or password");
    }
  }

  /// Fungsi Create Siswa
  static Future<void> createSiswa(SiswaModel data) async {
    final db = await initDB();

    await db.insert(
      'siswa',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Fungsi Get Siswa
  static Future<List<SiswaModel>> getAllSiswa() async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query('siswa');

    return List.generate(data.length, (i) => SiswaModel.fromMap(data[i]));
  }
}

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugaspraktikum7/anggota.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static late Database _database;

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'anggotas';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'anggota_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama TEXT, jabatan TEXT, bidang TEXT, keterangan TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertAnggota(Anggota anggota) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      anggota.toMap(),
    );
  }

  Future<List<Anggota>> getAnggotas() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Anggota.fromMap(res)).toList();
  }

  Future<int> deleteAnggota(int id) async {
    final Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateAnggota(Anggota anggota) async {
    final Database db = await database;
    return await db.update(_tableName, anggota.toMap(),
        where: 'id = ?', whereArgs: [anggota.id]);
  }
}

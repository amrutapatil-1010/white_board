import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  late Database _database;

  Future<void> openDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database.db');

    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE your_table (
          id INTEGER PRIMARY KEY,
          userName TEXT,
          password TEXT,
          userId INTEGER
        )
      ''');
    });
  }

  Future<int> insertData(SignInModel data) async {
    await openDB();
    return await _database.insert('your_table', data.toMap());
  }

  Future<List<SignInModel>> getData() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _database.query('your_table');
    return List.generate(maps.length, (index) {
      return SignInModel.fromMap(maps[index]);
    });
  }

  Future<int> updateData(SignInModel data) async {
    await openDB();
    return await _database.update('your_table', data.toMap(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<int> deleteData(int id) async {
    await openDB();
    return await _database
        .delete('your_table', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> closeDB() async {
    await _database.close();
  }
}

class SignInModel {
  final int? id;
  final String userName;
  final String password;
  final int userId;

  SignInModel({
    this.id,
    required this.userName,
    required this.password,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
      'userId': userId,
    };
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      id: map['id'],
      userName: map['userName'],
      password: map['password'],
      userId: map['userId'],
    );
  }
}

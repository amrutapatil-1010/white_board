import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _database;
  final String dbTableName = "dbTableName";
  String userNameColumn = "userNameColumn";
  String passwordColumn = "passwordColumn";
  String userIdColumn = "userIdColumn";

  Future<void> openDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database.db');

    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $dbTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          $userNameColumn TEXT,
          $passwordColumn TEXT,
          $userIdColumn INTEGER
        )
      ''');
    });
  }

  Future<int?> insertData(SignInModel data) async {
    await openDB();
    // Check if a record with the same userId already exists
    final existingData = await _database.query(dbTableName,
        where: "$userIdColumn = ?", whereArgs: [data.userId]);
    if (existingData.isNotEmpty) {
      log("error, can't add. UserId is already exist");
    } else {
      log("data added successfully");
      return await _database.insert(dbTableName, data.toMap());
    }
  }

  Future<List<SignInModel>> getData() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _database.query(dbTableName);
    return List.generate(maps.length, (index) {
      return SignInModel.fromMap(maps[index]);
    });
  }

  Future<int> updateData(SignInModel data) async {
    await openDB();
    return await _database.update(dbTableName, data.toMap(),
        where: '$userIdColumn = ?', whereArgs: [data.userId]);
  }

  Future<int> deleteData(int userId) async {
    await openDB();
    return await _database
        .delete(dbTableName, where: '$userIdColumn = ?', whereArgs: [userId]);
  }

  Future<void> closeDB() async {
    await _database.close();
  }

  Future<SignInModel?>? getSignInDataUserId(int userId) async {
    await openDB();
    List<Map<String, dynamic>> maps = await _database
        .query(dbTableName, where: "$userIdColumn= ?", whereArgs: [userId]);
    if (maps.isNotEmpty) {
      return SignInModel.fromMap(maps.first);
    } else {
      return null;
    }
  }
}

class SignInModel {
  final String userName;
  final String password;
  final int userId;

  SignInModel({
    required this.userName,
    required this.password,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userNameColumn': userName,
      'passwordColumn': password,
      'userIdColumn': userId,
    };
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      userName: map['userNameColumn'],
      password: map['passwordColumn'],
      userId: map['userIdColumn'],
    );
  }
}

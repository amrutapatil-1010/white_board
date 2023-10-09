import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:white_board/controller/sign_in_controller.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._instance;
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  late Database _database;

  ///table name
  final String signInDataTable = "signInDataTable";

  ///username
  final String userNameColumn = "userNameColumn";

  ///password
  final String passwordColumn = "passwordColumn";

  ///user id
  final String userIdColumn = "userIdColumn";

  ///crate Table
  Future openDB() async {
    final dbPath = await getDatabasesPath();
    if (_database.isOpen) return;

    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'signin_data.db');
    _database =
        await openDatabase(path, version: 1, onCreate: (Database db, version) {
      db.execute('''
          CREATE TABLE $signInDataTable(
            $userIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $userNameColumn TEXT NOT NULL,
            $passwordColumn TEXT NOT NULL
          )
        ''');
    });
  }

  ///Insert data
  Future<int> insertSignInData(SignInData data) async {
    await openDB();
    return _database.insert(signInDataTable, data.toMap());
  }

  ///update data
  Future<int> updateSignIndata(SignInData data) async {
    await openDB();
    return _database.update(signInDataTable, data.toMap(),
        where: "id=?", whereArgs: [data.userId]);
  }

  ///Sign in delete
  Future<int> deleteSignInData(SignInData data) async {
    await openDB();
    return _database
        .delete(signInDataTable, where: "id=?", whereArgs: [data.userId]);
  }

  ///SignIn getAll data
  Future<List<SignInData>> getSignInData() async {
    await openDB();
    final List<Map<String, dynamic>> maps =
        await _database.query(signInDataTable);
    return List.generate(
        maps.length,
        (index) => SignInData(
            userName: maps[index][userNameColumn],
            password: maps[index][passwordColumn],
            userId: maps[index][passwordColumn]));
  }
}

class SignInData {
  final String userName;
  final String password;
  final String userId;
  const SignInData(
      {required this.userName, required this.password, required this.userId});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "userName": userName,
      "password": password,
      "userId": userId,
    };
  }

  @override
  String toString() {
    return "SignInData(userName:$userName, userId:$userId, password:$password)";
  }
}

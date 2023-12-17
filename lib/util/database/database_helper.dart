import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_controller.dart';
import 'package:todo_list/util/model/timer_log.dart';
import 'package:todo_list/util/model/todo_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static final _databaseName = "flutDB.db";
  static final _databaseVersion = 3;
  static final table = 'tbl_todos';
  static final table_timer = 'tbl_todos_timer';
  static final todo_id = 'todo_id';
  static final time = 'time';

  static final title = "title";
  static final description = "description";
  static final dateTime = "dateTime";
  static final timeLimit = "timeLimit";
  static final status = "status";
  static final deleted = "deleted";
  static final startTime = "deleted";

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY, $title TEXT,$description TEXT,$dateTime INTEGER,
             $status TEXT,
              $deleted INTEGER,
              $timeLimit TEXT
           )
          ''');
    await db.execute('''
          CREATE TABLE $table_timer (
            id INTEGER PRIMARY KEY,
            $todo_id TEXT,
            $status TEXT,
            $time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
           )
          ''');
  }

  Future onUpgrade(Database db, int version, int newVersion) async {
    await db.execute('drop table $table');
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY, $title TEXT,$description TEXT,$dateTime INTEGER,
             $status TEXT,
              $deleted INTEGER,
              $timeLimit TEXT
           )
          ''');
    await db.execute('''
          CREATE TABLE $table_timer (
            id INTEGER PRIMARY KEY,
            $todo_id TEXT,
            $status TEXT,
            $time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
           )
          ''');
  }

  Future<bool> addUpdateTodo(TodoModel todoModel) async {
    var db = await database;
    if (todoModel.id == -1) {
      var id = await db.insert(table, todoModel.toJson());
      if (id != -1) {
        return true;
      }
      return false;
    } else {
      var id = await db.update(table, todoModel.toJson(),
          where: "id=?", whereArgs: [todoModel.id]);
      if (id != -1) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> addTimerLog(TimerLog todoModel) async {
    var db = await database;
    var id = await db.insert(table_timer, todoModel.toJson());
    if (id != -1) {
      return true;
    }
    return false;
  }
 Future<List<TimerLog>> getTimerLogs() async {
    var db = await database;
  var data =await db.rawQuery("SELECT id,$status, $time, ($time - LAG($time, 1) OVER (ORDER BY id)) AS difference FROM $table_timer");
   if(data.isNotEmpty){
      return data.map((e) => TimerLog.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<TodoModel>> getTodos() async {
    var db = await database;
    var response = await db.query(table, orderBy: "$dateTime DESC");
    if (response.isNotEmpty) {
      return response.map((e) => TodoModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<TodoModel?> updateTodoStatus(TodoModel todoModel) async {
    var db = await database;
    var checkIfRunning = await db.query(table, where: "$status=?", whereArgs: [
      TodoStatus.progress.name,
    ]);
    if (checkIfRunning.isNotEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          message:
              "One of task is already running please complete the running task",
          duration: Duration(seconds: 2),
        ),
      );
      return null;
    }

    todoModel.status = TodoStatus.progress;
    var response = await db.update(table, todoModel.toJson(),
        where: 'id=?', whereArgs: [todoModel.id]);
    addTimerLog(TimerLog(
        id: 0,
        todo_id: todoModel.id,
        time: DateTime.now(),
        status: todoModel.status, difference: 0));
    if (response != -1) {
      var result =
          await db.query(table, where: 'id=?', whereArgs: [todoModel.id]);
      if (result.isNotEmpty) {
        return TodoModel.fromJson(result.first);
      }
      return null;
    }
    return null;
  }

  Future<TodoModel?> stopRunningTask(TodoModel todoModel) async {
    var db = await database;

    var response = await db.update(table, todoModel.toJson(),
        where: 'id=?', whereArgs: [todoModel.id]);
    if (response != -1) {
      var result =
          await db.query(table, where: 'id=?', whereArgs: [todoModel.id]);
      addTimerLog(TimerLog(
          id: 0,
          difference: 0,
          todo_id: todoModel.id,
          time: DateTime.now(),
          status: todoModel.status));

      if (result.isNotEmpty) {
        return TodoModel.fromJson(result.first);
      }
      return null;
    }
    return null;
  }

  Future<bool> deleteTodo(TodoModel todoModel) async {
    var db = await database;
    var response =
        await db.delete(table, where: 'id=?', whereArgs: [todoModel.id]);
    return response != -1;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_riverpod/db/task_database.dart';

import '../models/todo_sqlite/todo_sqlite_model.dart';


class TaskTable {
  static const TABLE_NAME = 'tasks';
  static const CREATE_TABLE_QUERY = '''
  CREATE TABLE $TABLE_NAME(
     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    
    title TEXT,
    description TEXT,
    dateEnd TEXT)
''';
  static const DROP_TABLE_QUERY = '''
  DROP TABLE IF EXISTS $TABLE_NAME
''';
  Future<int> createTaskFromSqlite(TodoSqliteModel sqliteModel) async {
    final Database db = TaskDatabase.instance.database;

    final data = {
      'title': sqliteModel.title,
      'description': sqliteModel.description,
      'dateEnd': sqliteModel.dateEnd.toIso8601String(),
    };
    final result = await db.insert(TABLE_NAME, data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return result;
  }

  Future<List<Map<String, dynamic>>> getTasksFromSqlite() async {
    final Database db = TaskDatabase.instance.database;
   
    return db.query(
      TABLE_NAME,
      orderBy: 'id',
    );
  }

  Future<List<Map<String, dynamic>>> getTaskFromSqlite(int id) async {
    final Database db = TaskDatabase.instance.database;

    return db.query(TABLE_NAME, where: 'id = ?', whereArgs: [id], limit: 1);
  }

  Future<int> updateTaskFromSqlite(TodoSqliteModel sqliteModel) async {
    final Database db = TaskDatabase.instance.database;

    final data = {
      'id': sqliteModel.id,
      'title': sqliteModel.title,
      'description': sqliteModel.description,
      'dateEnd': sqliteModel.dateEnd.toIso8601String(),
    };
    final result = await db
        .update(TABLE_NAME, data, where: 'id = ?', whereArgs: [sqliteModel.id]);
    return result;
  }

  Future<void> deleteTaskFromSqlite(int id) async {
    final Database db = TaskDatabase.instance.database;

    try {
      await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAllTaskFromSqlite() async {
    final Database db = TaskDatabase.instance.database;
    try {
      await db.delete(TABLE_NAME);
    } catch (e) {
      rethrow;
    }
  }
}

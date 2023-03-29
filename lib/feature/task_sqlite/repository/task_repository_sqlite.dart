import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../db/task_table.dart';
import '../../../models/todo_sqlite/todo_sqlite_model.dart';



final taskRepositorySqliteProvider =
    Provider<TaskRepositorySqlite>((ref) => TaskRepositorySqlite());

class TaskRepositorySqlite {
  final TaskTable _taskTable = TaskTable();
  Future getTasksFromSqlite() async {
    List<Map<String, dynamic>> re = await _taskTable.getTasksFromSqlite();
    final todos = re.map((e) => TodoSqliteModel.fromJson(e)).toList();
    return todos;
  }

  Future<List<TodoSqliteModel>> getTaskFromSqlite(int id) async {
    List<Map<String, dynamic>> re = await _taskTable.getTaskFromSqlite(id);
    final todos = re.map((e) => TodoSqliteModel.fromJson(e)).toList();
    return todos;
  }

  Future<int> createTaskFromSqlite(TodoSqliteModel sqliteModel) async {
    return await _taskTable.createTaskFromSqlite(sqliteModel);
  }

  Future<int> updateTaskFromSqlite(TodoSqliteModel sqliteModel) async {
    return await _taskTable.updateTaskFromSqlite(sqliteModel);
  }

  Future<void> deleteTaskFromSqlite(int id) async {
    return await _taskTable.deleteTaskFromSqlite(id);
  }

  Future<void> deleteAllTaskFromSqlite() async {
    return await _taskTable.deleteAllTaskFromSqlite();
  }
}

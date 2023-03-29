import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/todo_sqlite/todo_sqlite_model.dart';
import '../repository/task_repository_sqlite.dart';






final taskControllerSqliteProvider = Provider(
    (ref) => TaskControllerSqlite(taskRepositorySqlite: ref.watch(taskRepositorySqliteProvider)));

final getTasksControllerSqliteProvider = FutureProvider<List<TodoSqliteModel>>((ref) {
  final todos = ref.read(taskControllerSqliteProvider).getTasksFromSqlite();
  return todos;
});


final getTaskControllerSqliteProvider = FutureProvider.family<List<TodoSqliteModel>,int>((ref,id) {
  final todos = ref.read(taskControllerSqliteProvider).getTaskFromSqlite(id);
  return todos;
});
class TaskControllerSqlite {
  final TaskRepositorySqlite _taskRepositorySqlite;
  TaskControllerSqlite({required TaskRepositorySqlite taskRepositorySqlite})
      : _taskRepositorySqlite = taskRepositorySqlite;

  Future<List<TodoSqliteModel>> getTasksFromSqlite() async {
    return await _taskRepositorySqlite.getTasksFromSqlite();
  }

  Future<List<TodoSqliteModel>> getTaskFromSqlite(int id) async {
    return await _taskRepositorySqlite.getTaskFromSqlite(id);
  }

  Future<int> createTaskFromSqlite(TodoSqliteModel sqliteModel) async {
    return await _taskRepositorySqlite.createTaskFromSqlite(sqliteModel);
  }

  Future<int> updateTaskFromSqlite(TodoSqliteModel sqliteModel) async {
    return await _taskRepositorySqlite.updateTaskFromSqlite(sqliteModel);
  }

  Future<void> deleteTaskFromSqlite(int id) async {
    return await _taskRepositorySqlite.deleteTaskFromSqlite(id);
  }

  Future<void> deleteAllTaskFromSqlite() async {
    return await _taskRepositorySqlite.deleteAllTaskFromSqlite();
  }
}

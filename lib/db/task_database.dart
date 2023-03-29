import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_riverpod/db/task_table.dart';


class TaskDatabase {
  static const DB_NAME = 'task_sqlite.db';
  static const DB_VERSION = 1;
  late Database _database;

  TaskDatabase._internal();

  Database get database => _database;

  static final TaskDatabase instance = TaskDatabase._internal();

  static const initScripts = [TaskTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TaskTable.CREATE_TABLE_QUERY];
  

  init() async {
    
    _database = await openDatabase(
     join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        for (var script in initScripts) {
         db.execute(script);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) {
        for (var script in migrationScripts) {
           db.execute(script);
        }
      },
      version: DB_VERSION
    );
  }
}

import 'package:sqflite/sqflite.dart';

import '../../models/task.dart';
import '../app_database.dart';

class TaskDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      'id INTEGER PRIMARY KEY, '
      'title TEXT, '
      'subtitle TEXT)';

  static const String _tableName = 'tasks';

  Future<int> save(Task task) async{
    final Database db = await getDatabase();
    final Map<String, dynamic> taskMap = {};

    taskMap['title'] = task.title;
    taskMap['subtitle'] = task.subtitle;

    return db.insert(_tableName, taskMap);
  }

  Future<List<Task>> findAll() async{
    final Database db = await getDatabase();
    return db.query(_tableName).then((maps){
      final List<Task> tasks = [];

      for(Map<String, dynamic> map in maps){
        final Task task = Task(map['id'], map['title'], map['subtitle']);
        tasks.add(task);
      }

      return tasks;
    });
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
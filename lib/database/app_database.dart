import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'todo.db');
    
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE tasks('
        'id INTEGER PRIMARY KEY, '
        'title TEXT, '
        'subtitle TEXT)');
    }, version: 1);
  });
}

Future<int> save(Task task){
  return createDatabase().then((db){
    final Map<String, dynamic> taskMap = Map();

    taskMap['title'] = task.title;
    taskMap['subtitle'] = task.subtitle;

    return db.insert('tasks', taskMap);
  });
}

Future<List<Task>> findAll(){
  return createDatabase().then((db){
    return db.query('tasks').then((maps){
      final List<Task> tasks = [];

      for(Map<String, dynamic> map in maps){
        final Task task = Task(map['id'], map['title'], map['subtitle']);
        tasks.add(task);
      }

      return tasks;
    });
  });
}
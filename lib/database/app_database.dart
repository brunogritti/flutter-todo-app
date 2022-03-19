import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/database/dao/task_dao.dart';

import 'dao/appointment_dao.dart';

Future<Database> getDatabase() async{
  final String path = join(await getDatabasesPath(), 'todosapp.db');
  return openDatabase(path, onCreate: (db, version){
      db.execute(TaskDao.tableSql);
      db.execute(AppointmentDao.tableSql);
    },
    version: 2,
    //onDowngrade: onDatabaseDowngradeDelete
  );
}
import 'package:sqflite/sqflite.dart';

import '../../models/appointment.dart';
import '../app_database.dart';

class AppointmentDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      'id INTEGER PRIMARY KEY, '
      'title TEXT, '
      'date TEXT)';

  static const String _tableName = 'appointments';

  Future<int> save(Appointment appointment) async{
    final Database db = await getDatabase();
    final Map<String, dynamic> appointmentMap = {};

    appointmentMap['title'] = appointment.title;
    appointmentMap['date'] = appointment.date;

    return db.insert(_tableName, appointmentMap);
  }

  Future<List<Appointment>> findAll() async{
    final Database db = await getDatabase();
    return db.query(_tableName).then((maps){
      final List<Appointment> appointments = [];

      for(Map<String, dynamic> map in maps){
        final Appointment appointment = Appointment(map['id'], map['title'], map['date']);
        appointments.add(appointment);
      }

      return appointments;
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
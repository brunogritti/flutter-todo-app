import 'package:flutter/material.dart';
import 'package:todo/database/app_database.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/dashboard.dart';
import 'package:todo/screens/task_form.dart';
import 'package:todo/screens/tasks_list.dart';

void main() {
  runApp(const TodoApp());
  save(Task(0, 'Do the dishes', 'with water')).then((id){
    findAll().then((tasks) => debugPrint(tasks.toString()));
  });
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red[900],
          accentColor: Colors.redAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.redAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
          ),
      ),
      home: Dashboard(),
    );
  }
}
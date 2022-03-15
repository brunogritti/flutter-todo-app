import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

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

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/todo-icon.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 70,
              width: 110,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    'Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
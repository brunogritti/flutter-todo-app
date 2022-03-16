import 'package:flutter/material.dart';
import 'package:todo/screens/task_form.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Clean Keyboard', style: TextStyle(fontSize: 22.0),),
              subtitle: Text('With Alcohol', style: TextStyle(fontSize: 16.0),),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TaskForm(),
          )).then((newTask) => debugPrint(newTask.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

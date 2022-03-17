import 'package:flutter/material.dart';
import 'package:todo/screens/task_form.dart';

import '../database/dao/task_dao.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final TaskDao _dao = TaskDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: FutureBuilder<List<Task>>(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          if(snapshot.data != null){
            final List<Task>? tasks = snapshot.data;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final task = tasks![index];
                return _TaskItem(task);
              },
              itemCount: tasks?.length,
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TaskForm(),
          )).then((newTask) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final Task task;

  _TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title, style: const TextStyle(fontSize: 22.0),),
        subtitle: Text(task.subtitle, style: const TextStyle(fontSize: 16.0),),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/screens/task/form.dart';

import '../../database/dao/task_dao.dart';
import '../../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final TaskDao _dao = TaskDao();
  refresh() {
    setState(() {});
  }
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
                return _TaskItem(task, refresh);
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

class _TaskItem extends StatefulWidget {
  final Task task;
  final Function() notifyParent;

  _TaskItem(this.task, this.notifyParent);

  @override
  State<_TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<_TaskItem> {
  final TaskDao _dao = TaskDao();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.task.title, style: const TextStyle(fontSize: 22.0),),
        subtitle: Text(widget.task.subtitle, style: const TextStyle(fontSize: 16.0),),
        trailing: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Você deseja apagar essa tarefa?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _dao.delete(widget.task.id).then((id) {
                        setState(() {});
                        Navigator.pop(context, 'OK');
                        widget.notifyParent();
                      });
                    });
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: Icon(Icons.delete),
        ),
      ),
    );
  }
}

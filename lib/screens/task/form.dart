import 'package:flutter/material.dart';
import 'package:todo/database/dao/task_dao.dart';
import 'package:todo/models/task.dart';

class TaskForm extends StatefulWidget {
  TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TaskDao _dao = TaskDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _subtitleController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: (){
                      final String? title = _titleController.text;
                      final String? subtitle = _subtitleController.text;
                      
                      final Task newTask = Task(0, title!, subtitle!);
                      _dao.save(newTask).then((id) => Navigator.pop(context));
                    },
                    child: const Text('Create')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

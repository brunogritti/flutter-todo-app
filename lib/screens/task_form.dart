import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskForm extends StatefulWidget {
  TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
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
                      
                      final Task newTask = Task(title!, subtitle!);
                      Navigator.pop(context, newTask);
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

import 'package:flutter/material.dart';
import 'package:todo/database/dao/appointment_dao.dart';
import 'package:todo/models/appointment.dart';
import 'package:intl/intl.dart';

class AppointmentForm extends StatefulWidget {
  AppointmentForm({Key? key}) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {

  final TextEditingController _titleController = TextEditingController();
  final AppointmentDao _dao = AppointmentDao();
  DateTime _dateController = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _dateController,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _dateController) {
      setState(() {
        _dateController = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Appointment'),
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
              child: ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: (){
                      final String? title = _titleController.text;
                      final String? date = DateFormat('dd-MM-yyyy').format(_dateController);;
                      
                      final Appointment newAppointment = Appointment(0, title!, date!);
                      _dao.save(newAppointment).then((id) => Navigator.pop(context));
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

import 'package:flutter/material.dart';
import 'package:todo/screens/appointment/form.dart';

import '../../database/dao/appointment_dao.dart';
import '../../models/appointment.dart';

class AppointmentsList extends StatefulWidget {
  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  final AppointmentDao _dao = AppointmentDao();
  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: FutureBuilder<List<Appointment>>(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          if(snapshot.data != null){
            final List<Appointment>? appointments = snapshot.data;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final appointment = appointments![index];
                return _AppointmentItem(appointment, refresh);
              },
              itemCount: appointments?.length,
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
            builder: (context) => AppointmentForm(),
          )).then((newAppointment) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AppointmentItem extends StatefulWidget {
  final Appointment appointment;
  final Function() notifyParent;

  _AppointmentItem(this.appointment, this.notifyParent);

  @override
  State<_AppointmentItem> createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<_AppointmentItem> {
  final AppointmentDao _dao = AppointmentDao();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.appointment.title, style: const TextStyle(fontSize: 22.0),),
        subtitle: Text(widget.appointment.date, style: const TextStyle(fontSize: 16.0),),
        trailing: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Você deseja apagar esse compromisso?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _dao.delete(widget.appointment.id).then((id) {
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

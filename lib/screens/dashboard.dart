import 'package:flutter/material.dart';
import 'package:todo/screens/appointment/list.dart';
import 'package:todo/screens/task/list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/todo-icon.png'),
          ),
          Row(
            children: [
              Button(
                label: 'Tasks',
                icon: Icons.check,
                screen: TasksList(),
              ),
              Button(
                label: 'Appointments',
                icon: Icons.calendar_today_sharp,
                screen: AppointmentsList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  
  final String label;
  final IconData icon;
  final Widget screen;

  const Button({Key? key, required this.label, required this.icon, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.red,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => screen,
            ));
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 70,
            width: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
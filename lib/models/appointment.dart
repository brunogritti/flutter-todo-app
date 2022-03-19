class Appointment {
  final int id;
  final String title;
  final String date;

  Appointment(this.id, this.title, this.date);

  @override
  String toString() {
    return 'Appointment{id: $id, title: $title, date: $date}';
  }
}
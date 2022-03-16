class Task {
  final int id;
  final String title;
  final String subtitle;

  Task(this.id, this.title, this.subtitle);

  @override
  String toString() {
    return 'Task{id: $id, title: $title, subtitle: $subtitle}';
  }
}
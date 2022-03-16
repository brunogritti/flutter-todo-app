class Task {
  final String title;
  final String subtitle;

  Task(this.title, this.subtitle);

  @override
  String toString() {
    return 'Task{title: $title, subtitle: $subtitle}';
  }
}
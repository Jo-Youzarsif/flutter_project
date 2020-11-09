class Tasks {
  List<Task> tasks;

  Tasks(this.tasks);

  factory Tasks.fromJson(Map<dynamic, dynamic> json) {
    var tasks = List<Task>();
    json.forEach((key, value) {
      Task task = Task.fromJson(value);
      tasks.add(task);
    });
    return Tasks(tasks);
  }
}

class Task {
  //final String id;
  final String username;
  final String password;

  Task({this.username, this.password});

  factory Task.fromJson(Map<dynamic, dynamic> json) {
    return Task(
      username: json['username'],
      password: json['password'],
    );
  }
}

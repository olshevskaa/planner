import 'dart:convert';

import 'package:planner/src/domain/entities/task.dart';

class ProjectTaskModel extends Task {
  final List<Task> tasks;
  ProjectTaskModel({
    required super.id,
    required super.title,
    required super.isCompleted,
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'tasks': tasks.map((task) => (task as ProjectTaskModel).toMap()).toList(),
    };
  }

  factory ProjectTaskModel.fromMap(Map<String, dynamic> map) {
    return ProjectTaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
      tasks: (map['tasks'] as List)
          .map((task) => ProjectTaskModel.fromMap(task as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectTaskModel.fromJson(String source) =>
      ProjectTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

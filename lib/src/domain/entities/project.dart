import 'package:planner/src/domain/entities/task.dart';

class Project {
  final String id;
  final String name;
  final String? description;
  final List<Task> tasks;
  final bool finished;
  final String? cover;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.tasks,
    required this.finished,
    required this.cover,
  });
}
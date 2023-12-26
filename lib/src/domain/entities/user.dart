import 'package:planner/src/domain/entities/meeting.dart';
import 'package:planner/src/domain/entities/task.dart';

class User {
  final String id;
  final String name;
  final String email;
  final List<Task> tasks;
  final int tasksCompleted;
  final List<Meeting> meetings;
  final String provider;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.tasks,
    required this.tasksCompleted,
    required this.meetings,
    required this.provider,
  });
}
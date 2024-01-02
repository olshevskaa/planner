import 'package:planner/src/domain/entities/task.dart';

class User {
  final String id;
  final String email;
  final int tasksCompleted;
  final String provider;

  User({
    required this.id,
    required this.email,
    required this.tasksCompleted,
    required this.provider,
  });
}
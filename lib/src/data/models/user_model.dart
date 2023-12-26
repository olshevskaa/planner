import 'dart:convert';

import 'package:planner/src/data/models/meeting_model.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:planner/src/domain/entities/meeting.dart';
import 'package:planner/src/domain/entities/task.dart';
import 'package:planner/src/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.tasks,
    required super.tasksCompleted,
    required super.meetings,
    required super.provider,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'tasks': tasks.map((x) => (x as TaskModel).toMap()).toList(),
      'tasksCompleted': tasksCompleted,
      'meetings': meetings.map((x) => (x as MeetingModel).toMap()).toList(),
      'provider': provider,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      tasks: List<Task>.from(
        (map['tasks'] as List<dynamic>).map<Task>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tasksCompleted: map['tasksCompleted'] as int,
      meetings: List<Meeting>.from(
        (map['meetings'] as List<dynamic>).map<Meeting>(
          (x) => MeetingModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      provider: map['provider'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

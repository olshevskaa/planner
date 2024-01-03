import 'dart:convert';

import 'package:planner/src/domain/entities/task.dart';

class TaskModel extends Task {
  final String date;
  TaskModel({
    required super.id,
    required super.title,
    required super.isCompleted,
    required this.date,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
      date: map['date'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'date': date,
    };
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
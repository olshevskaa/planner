import 'package:planner/src/data/models/project_task_model.dart';
import 'package:planner/src/domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel({
    required super.id,
    required super.name,
    required super.description,
    required super.tasks,
    required super.finished,
    required super.cover,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
      tasks: (map['tasks'] as List)
          .map((task) => ProjectTaskModel.fromMap(task as Map<String, dynamic>))
          .toList(),
      finished: map['finished'] as bool,
      cover: map['cover'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'tasks': tasks.map((task) => (task as ProjectTaskModel).toMap()).toList(),
      'finished': finished,
      'cover': cover,
    };
  }
}
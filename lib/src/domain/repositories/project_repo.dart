import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/data/models/project_model.dart';

abstract class ProjectRepo {
  ResultVoid addProject({
    required String userId,
    required String name,
    String? description,
    String? cover,
  });

  ResultFuture<List<ProjectModel>> getProjects({required String userId});

  ResultVoid deleteProject({
    required String userId,
    required String projectId,
  });

  ResultVoid finishProject({
    required String userId,
    required String projectId,
    required bool value,
  });
}
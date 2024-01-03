import 'package:planner/src/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<void> addProject({
    required String userId,
    required String title,
    required String date,
  });

  Future<List<ProjectModel>> getProjects({required String userId});

  Future<void> completeProject({
    required String userId,
    required String projectId,
    required bool value,
  });

  Future<void> deleteProject({
    required String userId,
    required String projectId,
  });
}
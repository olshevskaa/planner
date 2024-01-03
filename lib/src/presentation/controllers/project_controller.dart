import 'package:get/get.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:planner/src/domain/usecases/project/add_project.dart';
import 'package:planner/src/domain/usecases/project/delete_project.dart';
import 'package:planner/src/domain/usecases/project/finish_project.dart';
import 'package:planner/src/domain/usecases/project/get_projects.dart';

class ProjectController extends GetxController {
  ProjectController(
    this._addProject,
    this._deleteProject,
    this._finishProject,
    this._getProjects,
  );

  final AddProject _addProject;
  final DeleteProject _deleteProject;
  final FinishProject _finishProject;
  final GetProjects _getProjects;

  Future<void> addProject({
    required String userId,
    required String name,
    String? description,
    String? cover,
  }) async {
    final result = await _addProject.call(
      AddProjectParams(
        userId,
        name,
        description,
        cover,
      ),
    );
    result.fold(
      (failure) => printError(info: failure.message),
      (success) {},
    );
  }

  Future<void> deleteProject({
    required String userId,
    required String projectId,
  }) async {
    final result = await _deleteProject.call(
      DeleteProjectParams(
        userId,
        projectId,
      ),
    );
    result.fold(
      (failure) => printError(info: failure.message),
      (success) {},
    );
  }

  Future<void> finishProject({
    required String userId,
    required String projectId,
    required bool value,
  }) async {
    final result = await _finishProject.call(
      FinishProjectParams(
        userId,
        projectId,
        value,
      ),
    );
    result.fold(
      (failure) => printError(info: failure.message),
      (success) {},
    );
  }

  Future<List<ProjectModel>?> getProjects({required String userId}) async {
    final result = await _getProjects.call(
      GetProjectParams(
        userId,
      ),
    );
    return result.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
        return [];
      },
      (projects) => projects,
    );
  }
}

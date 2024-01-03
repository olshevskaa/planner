import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class DeleteProject extends UseCaseWithParams<void, DeleteProjectParams> {
  DeleteProject(this._repository);

  final ProjectRepo _repository;

  @override
  ResultVoid call(DeleteProjectParams params) async {
    return await _repository.deleteProject(
      userId: params.userId,
      projectId: params.projectId,
    );
  }
}

class DeleteProjectParams {
  DeleteProjectParams(
    this.userId,
    this.projectId,
  );

  final String userId;
  final String projectId;
}

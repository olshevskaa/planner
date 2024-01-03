import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class FinishProject extends UseCaseWithParams<void, FinishProjectParams> {
  FinishProject(this._repository);

  final ProjectRepo _repository;

  @override
  ResultVoid call(FinishProjectParams params) async {
    return await _repository.finishProject(
      userId: params.userId,
      projectId: params.projectId,
    );
  }
}

class FinishProjectParams {
  FinishProjectParams(
    this.userId,
    this.projectId,
  );

  final String userId;
  final String projectId;
}
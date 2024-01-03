import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class GetProjects extends UseCaseWithParams<List<ProjectModel>, GetProjectParams> {
  final ProjectRepo _repository;

  GetProjects(this._repository);

  @override
  ResultFuture<List<ProjectModel>> call(GetProjectParams params) async {
    return await _repository.getProjects(userId: params.userId);
  }
}

class GetProjectParams {
  GetProjectParams(this.userId);

  final String userId;
}
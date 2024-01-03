import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class GetProjects extends UseCaseWithParams<List<ProjectModel>, String> {
  final ProjectRepo _repository;

  GetProjects(this._repository);

  @override
  ResultFuture<List<ProjectModel>> call(String userId) async {
    return await _repository.getProjects(userId: userId);
  }
}
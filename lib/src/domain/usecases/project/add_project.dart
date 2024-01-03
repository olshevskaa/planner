import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class AddProject extends UseCaseWithParams<void, AddProjectParams> {
  AddProject(this._repository);

  final ProjectRepo _repository;

  @override
  ResultVoid call(AddProjectParams params) async => await _repository.addProject(
        userId: params.userId,
        name: params.name,
        description: params.description,
        cover: params.cover,
      );
}

class AddProjectParams {
  AddProjectParams(
    this.userId,
    this.name,
    this.description,
    this.cover,
  );

  final String userId;
  final String name;
  final String? description;
  final String? cover;
}

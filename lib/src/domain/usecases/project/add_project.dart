import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class CreateProject extends UseCaseWithParams<void, ProjectParams> {
  CreateProject(this._repository);

  final ProjectRepo _repository;

  @override
  ResultVoid call(ProjectParams params) async => await _repository.addProject(
        name: params.name,
        description: params.description,
        cover: params.cover,
      );
}

class ProjectParams {
  ProjectParams(
    this.name,
    this.description,
    this.cover,
  );

  final String name;
  final String? description;
  final String? cover;
}

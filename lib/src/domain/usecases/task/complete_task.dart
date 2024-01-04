import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/task_repo.dart';

class CompleteTask extends UseCaseWithParams<void, CompleteTaskParams> {
  final TaskRepo _repository;

  CompleteTask(this._repository);

  @override
  ResultVoid call(CompleteTaskParams params) async =>
      await _repository.completeTask(
        userId: params.userId,
        taskId: params.taskId,
        value: params.value,
      );
}

class CompleteTaskParams {
  final String userId;
  final String taskId;
  final bool value;

  CompleteTaskParams(
    this.userId,
    this.taskId,
    this.value
  );
}

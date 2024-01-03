import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/task_repo.dart';

class DeleteTask extends UseCaseWithParams<void, DeleteTaskParams> {
  final TaskRepo _repository;

  DeleteTask(this._repository);

  @override
  ResultVoid call(DeleteTaskParams params) async {
    return await _repository.deleteTask(
      userId: params.userId,
      taskId: params.taskId,
    );
  }
}

class DeleteTaskParams {
  final String userId;
  final String taskId;

  DeleteTaskParams(
    this.userId,
    this.taskId,
  );
}
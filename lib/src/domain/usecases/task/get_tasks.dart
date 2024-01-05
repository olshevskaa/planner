import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/entities/task.dart';
import 'package:planner/src/domain/repositories/task_repo.dart';

class GetTasks extends UseCaseWithParams<List<Task>, GetTasksParams> {
  GetTasks(this._taskRepo);

  final TaskRepo _taskRepo;

  @override
  ResultFuture<List<Task>> call(GetTasksParams params) => _taskRepo.getTasks(userId: params.userId);
}

class GetTasksParams {
  GetTasksParams(this.userId);

  final String userId;
}
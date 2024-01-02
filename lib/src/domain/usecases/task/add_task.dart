import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/task_repo.dart';

class AddTask extends UseCaseWithParams<void, TaskParams> {
  final TaskRepo _repository;

  AddTask(this._repository);

  @override
  ResultVoid call(TaskParams params) async {
    return await _repository.addTask(
      userId: params.userId,
      title: params.title,
      date: params.date,
    );
  }
}

class TaskParams {
  final String userId;
  final String title;
  final String date;

  TaskParams(
    this.userId,
    this.title,
    this.date,
  );
}

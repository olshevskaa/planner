import 'package:dartz/dartz.dart';
import 'package:planner/core/errors/failure.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/data/datasources/task_remote_data_source.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:planner/src/domain/repositories/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  final TaskRemoteDataSource _taskDataSource;

  TaskRepoImpl(this._taskDataSource);

  @override
  ResultVoid addTask({
    required String userId,
    required String title,
    required String date,
  }) async {
    try {
      await _taskDataSource.addTask(userId, title, date);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<TaskModel>> getTasks({required String userId}) async {
    try {
      final tasks = await _taskDataSource.getTasks(userId);
      return Right(tasks);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid completeTask({
    required String userId,
    required String taskId,
    required bool value,
  }) async {
    try {
      await _taskDataSource.completeTask(userId, taskId, value);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid deleteTask({
    required String userId,
    required String taskId,
  }) async {
    try {
      await _taskDataSource.deleteTask(userId, taskId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}

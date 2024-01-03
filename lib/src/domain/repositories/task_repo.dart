import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/entities/task.dart';

abstract class TaskRepo {
  ResultVoid addTask({
    required String userId,
    required String title,
    required String date,
  });

  ResultFuture<List<Task>> getTasks({required String userId});

  ResultVoid completeTask({
    required String userId,
    required String taskId,
    required bool value,
  });

  ResultVoid deleteTask({
    required String userId,
    required String taskId,
  });
}

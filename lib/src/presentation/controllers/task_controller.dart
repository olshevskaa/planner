import 'package:get/get.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:planner/src/domain/usecases/task/add_task.dart';
import 'package:planner/src/domain/usecases/task/complete_task.dart';
import 'package:planner/src/domain/usecases/task/get_tasks.dart';
import 'package:planner/src/presentation/controllers/calendar_controller.dart';

class TaskController extends GetxController {
  TaskController(this._addTask, this._getTasks, this._completeTask);

  final AddTask _addTask;
  final GetTasks _getTasks;
  final CompleteTask _completeTask;

  final CalendarController _calendarController = Get.find<CalendarController>();

  Future<void> addTask(String userId, String title) async {
    var result = await _addTask(
      TaskParams(
        userId,
        title,
        _calendarController.selectedDate.toIso8601String(),
      ),
    );

    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (success) {}
    );
  }

  Future<List<TaskModel>> getTasks(String userId) async {
    var result = await _getTasks(userId);

    return result.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
        return [];
      },
      (list) => list as List<TaskModel>,
    );
  }

  Future<void> completeTask(String userId, String taskId, bool value) async {
    var result = await _completeTask(CompleteTaskParams(userId, taskId, value));

    result.fold((failure) => Get.snackbar('Error', failure.message),
        (success) {});
  }
}

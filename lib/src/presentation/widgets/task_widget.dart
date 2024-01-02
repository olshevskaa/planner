import 'package:flutter/material.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/task_controller.dart';
import 'package:get/get.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    super.key,
    required this.task,
    required this.updateTasks,
  });

  final TaskController controller = Get.find<TaskController>();
  final AuthService authController = Get.find<AuthService>();

  final TaskModel task;
  final Function updateTasks;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (value) async {
                await controller.completeTask(
                  authController.user!.id, task.id, value!);
                  updateTasks();
              },
            ),
          )),
    );
  }
}

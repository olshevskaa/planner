import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/task_controller.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';

class AddTaskScreen extends HookWidget {
  AddTaskScreen({super.key});

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();

  final TaskController taskController = Get.find<TaskController>();
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Dimensions.height15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(
                labelText: 'nameLabelText'.tr,
              ),
            ),
            SizedBox(height: Dimensions.height10 * 2),
            MainButton(
              text: 'createTask',
              onTap: () => taskController.addTask(
                authService.user!.id,
                taskNameController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/landing_page_controller.dart';
import 'package:planner/src/presentation/controllers/task_controller.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';

class AddTaskScreen extends StatefulHookWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final TaskController taskController = Get.find<TaskController>();
  final AuthService authService = Get.find<AuthService>();
  final LandingPageController landingPageController =
      Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Dimensions.height15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: taskNameController,
                decoration: InputDecoration(
                  labelText: 'nameLabelText'.tr,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'nameValidationText'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: Dimensions.height10 * 2),
              MainButton(
                text: 'createTask',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    taskController.addTask(
                      authService.user!.id,
                      taskNameController.text,
                    );
                    landingPageController.changeIndex(0);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

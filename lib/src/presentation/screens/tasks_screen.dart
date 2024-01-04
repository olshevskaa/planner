import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/core/utils/routes.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/calendar_controller.dart';
import 'package:planner/src/presentation/controllers/task_controller.dart';
import 'package:planner/src/presentation/widgets/task_group.dart';
import 'package:planner/src/presentation/widgets/title_text.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

class TasksScreen extends HookWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController =
        Get.find<CalendarController>();
    final TaskController taskController = Get.find<TaskController>();
    final AuthService authService = Get.find<AuthService>();

    final tasksList = useState(<TaskModel>[]);

    updateTasks() {
      taskController.getTasks(authService.user!.id).then((result) {
        tasksList.value = result;
      });
    }

    useEffect(() {
      updateTasks();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(Dimensions.wigth10),
            child: IconButton(
              onPressed: () => Get.toNamed(Routes.projects),
              icon: const Icon(MfgLabs.folder_open),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.wigth10),
        child: Column(
          children: [
            CalendarTimeline(
              initialDate: calendarController.selectedDate,
              firstDate: calendarController.firstDate,
              lastDate: calendarController.lastDate,
              onDateSelected: (DateTime time) {
                calendarController.onDateSelected(time);
                updateTasks();
              },
              leftMargin: Dimensions.wigth10,
            ),
            SizedBox(height: Dimensions.height10),
            const TitleText(text: 'tasks'),
            SizedBox(height: Dimensions.height10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TaskGroup(
                      text: 'notStarted',
                      tasks: tasksList.value
                          .where((task) =>
                              !task.isCompleted &&
                              DateTime.parse(task.date).compareTo(
                                      calendarController.selectedDate) ==
                                  0)
                          .toList(),
                      updateTasks: updateTasks,
                    ),
                    SizedBox(height: Dimensions.height10),
                    TaskGroup(
                      text: 'done',
                      tasks: tasksList.value
                          .where((task) =>
                              task.isCompleted &&
                              DateTime.parse(task.date).compareTo(
                                      calendarController.selectedDate) ==
                                  0)
                          .toList(),
                      updateTasks: updateTasks,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

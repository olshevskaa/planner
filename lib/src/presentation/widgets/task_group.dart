import 'package:flutter/material.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:planner/src/presentation/widgets/subtitle_text.dart';
import 'package:planner/src/presentation/widgets/task_widget.dart';

class TaskGroup extends StatelessWidget {
  const TaskGroup({
    super.key,
    required this.text,
    required this.tasks,
    required this.updateTasks,
  });

  final String text;
  final List<TaskModel> tasks;
  final Function updateTasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SubtitleText(text: text),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(Dimensions.wigth10),
            child: TaskWidget(
              task: tasks[index],
              updateTasks: updateTasks,
            ),
          ),
        ),
      ],
    );
  }
}

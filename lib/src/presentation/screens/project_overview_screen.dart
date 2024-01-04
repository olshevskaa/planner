import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:planner/src/data/models/project_task_model.dart';

class ProjectOverviewScreen extends HookWidget {
  ProjectOverviewScreen({super.key});

  final String projectId = Get.parameters['id']!;


  @override
  Widget build(BuildContext context) {

  final projectTasks = useState(<List<ProjectTaskModel>>[]);
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Overview'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(),
    );
  }
}
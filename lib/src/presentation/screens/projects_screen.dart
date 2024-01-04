import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/core/utils/routes.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/project_controller.dart';
import 'package:planner/src/presentation/widgets/project_widget.dart';

class ProjectsScreen extends HookWidget {
  ProjectsScreen({super.key});

  final ProjectController projectController = Get.find<ProjectController>();
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    final projectsList = useState(<ProjectModel>[]);

    updateProjects() {
      projectController
          .getProjects(userId: authService.user!.id)
          .then((result) {
        projectsList.value = result;
      });
    }

    useEffect(() {
      updateProjects();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Octicons.home),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: projectsList.value.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    ProjectWidget(project: projectsList.value[index]),
                    SizedBox(height: Dimensions.height10 * 2)
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addProject),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

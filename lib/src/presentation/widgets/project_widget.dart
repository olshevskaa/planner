import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/core/utils/routes.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:planner/src/presentation/widgets/body_text.dart';
import 'package:planner/src/presentation/widgets/subtitle_text.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.project, parameters: {'id': project.id}),
      onLongPress: () {},
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(Dimensions.wigth10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                project.cover == null || project.cover!.isEmpty
                    ? const SizedBox()
                    : ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        child: Align(
                          widthFactor: 1,
                          heightFactor: 0.5,
                          child: Image.network(
                            project.cover!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                SizedBox(height: Dimensions.height10 / 2),
                SubtitleText(text: project.name),
                SizedBox(height: Dimensions.height10 / 2),
                BodyText(text: project.description ?? ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planner/src/presentation/controllers/project_controller.dart';
import 'package:planner/src/presentation/widgets/body_text.dart';

class PickImageDialogOption extends StatelessWidget {
  PickImageDialogOption({
    super.key,
    required this.text,
    required this.imageSource,
    required this.setImage,
    required this.icon,
  });

  final String text;
  final ImageSource imageSource;
  final Function setImage;
  final IconData icon;

  final ProjectController projectController = Get.find<ProjectController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: BodyText(text: text),
      onTap: () async {
        final Uint8List? pickedImage =
            await projectController.pickImage(imageSource);
        if (pickedImage != null) {
          setImage(pickedImage);
        }
      },
    );
  }
}

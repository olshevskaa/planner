import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/project_controller.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';
import 'package:planner/src/presentation/widgets/pick_image_dialog_option.dart';
import 'package:planner/src/presentation/widgets/subtitle_text.dart';

class AddProjectScreen extends HookWidget {
  AddProjectScreen({super.key});

  final ProjectController projectController = Get.find<ProjectController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController descriptionController =
        useTextEditingController();
    final AuthService authService = Get.find<AuthService>();

    final image = useState<Uint8List?>(null);

    setImage(Uint8List? pickedImage) {
      image.value = pickedImage;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height10 * 2),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'nameLabel',
                ),
              ),
              SizedBox(height: Dimensions.height10 * 2),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'descriptionLabel',
                ),
              ),
              SizedBox(height: Dimensions.height10 * 2),
              image.value == null
                  ? Column(
                      children: [
                        const SubtitleText(text: 'addCover'),
                        IconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                              children: [
                                PickImageDialogOption(
                                  text: 'camera',
                                  imageSource: ImageSource.camera,
                                  setImage: setImage,
                                  icon: Icons.camera_alt,
                                ),
                                PickImageDialogOption(
                                  text: 'gallery',
                                  imageSource: ImageSource.gallery,
                                  setImage: setImage,
                                  icon: Icons.photo,
                                ),
                              ],
                            ),
                          ),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        ClipRect(
                          child: Align(
                            widthFactor: 1,
                            heightFactor: 0.5,
                            child: Image.memory(
                              image.value!,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(Dimensions.wigth10),
                          child: IconButton(
                            onPressed: () => image.value = null,
                            icon: Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ],
                    ),
              MainButton(
                text: 'createProject',
                onTap: () => projectController.addProject(
                  userId: authService.user!.id,
                  name: nameController.text,
                  description: descriptionController.text,
                  cover: image.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

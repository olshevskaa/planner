import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/widgets/continue_with.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find<AuthService>();

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final nameController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimensions.wigth10),
          margin: EdgeInsets.all(Dimensions.wigth10),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png',
                  height: Dimensions.height10 * 7),
              SizedBox(height: Dimensions.height10 * 2),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'nameLabelText'.tr,
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'emailLabelText'.tr,
                ),
              ),
              SizedBox(height: Dimensions.height10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'passwordLabelText'.tr,
                ),
                obscureText: true,
              ),
              SizedBox(height: Dimensions.height10),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'confirmPasswordLabelText'.tr,
                ),
                obscureText: true,
              ),
              SizedBox(height: Dimensions.height10 * 2),
              MainButton(
                text: 'signUp',
                onTap: () => authService.signUp(
                  emailController.text,
                  nameController.text,
                  passwordController.text,
                ),
              ),
              SizedBox(height: Dimensions.height10 * 2),
              ContinueWith()
            ],
          ),
        ),
      ),
    );
  }
}

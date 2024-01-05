import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/core/utils/email_validator.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/widgets/continue_with.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find<AuthService>();

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/logo.png',
                    height: Dimensions.height10 * 7),
                SizedBox(height: Dimensions.height10 * 2),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'emailLabelText'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'emailEmptyValidationText'.tr;
                    }
                    if (!value.isValidEmail()) {
                      return 'emailValidationText'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimensions.height10),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'passwordLabelText'.tr,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'passwordEmptyValidationText'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimensions.height10 * 2),
                MainButton(
                  text: 'logIn',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      authService.signIn(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
                SizedBox(height: Dimensions.height10 * 2),
                ContinueWith()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

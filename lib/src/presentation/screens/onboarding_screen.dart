import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/themes/theme_service.dart';
import 'package:planner/core/translations/locale_service.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/core/utils/routes.dart';
import 'package:planner/src/presentation/widgets/body_text.dart';
import 'package:planner/src/presentation/widgets/title_text.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final LocaleService localeService = Get.put(LocaleService());
  final ThemeService themeService = Get.put(ThemeService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight - Dimensions.onboardTextArea,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius15 * 2),
                topRight: Radius.circular(Dimensions.radius15 * 2),
              ),
            ),
            height: Dimensions.onboardTextArea,
            width: double.infinity,
            padding: EdgeInsets.all(Dimensions.height10 * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    TitleText(text: 'plan'),
                    TitleText(text: 'do'),
                    TitleText(text: 'achieve'),
                  ],
                ),
                MainButton(
                  text: 'signUp',
                  onTap: () => Get.toNamed(
                    Routes.signUp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BodyText(
                      text:
                      'alreadyHaveAnAccount',
                    ),
                    SizedBox(width: Dimensions.width8),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.login),
                      child: const BodyText(
                        text: 'logIn',
                        color: Color.fromARGB(163, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

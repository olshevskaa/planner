import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/themes/theme_service.dart';
import 'package:planner/core/translations/locale_service.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/landing_page_controller.dart';
import 'package:planner/src/presentation/widgets/body_text.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';
import 'package:planner/src/presentation/widgets/subtitle_text.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final LocaleService localeService = Get.find<LocaleService>();
  final ThemeService themeService = Get.find<ThemeService>();
  final AuthService authService = Get.find<AuthService>();
  final LandingPageController landingPageController =
      Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.height10 * 2.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubtitleText(text: 'language'),
                DropdownButton(
                  onChanged: (value) => localeService.switchLocale(value),
                  value: localeService.locale,
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: BodyText(text: 'EN'),
                    ),
                    DropdownMenuItem(
                      value: 'uk',
                      child: BodyText(text: 'UK'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimensions.height10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubtitleText(text: 'theme'),
                DropdownButton(
                  onChanged: (value) => themeService.switchTheme(value),
                  value: themeService.theme,
                  items:  const [
                    DropdownMenuItem(
                      value: 'light',
                      child: BodyText(text: 'lightTheme'),
                    ),
                    DropdownMenuItem(
                      value: 'dark',
                      child: BodyText(text: 'darkTheme'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimensions.height10 * 4),

            MainButton(text: 'logOut', onTap: () {
              authService.logOut();
              landingPageController.changeIndex(0);
            })
          ],
        ),
      ),
    );
  }
}

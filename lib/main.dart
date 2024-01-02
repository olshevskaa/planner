import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:planner/core/services/dependency_injection.dart';
import 'package:planner/core/services/user_model_hive_adapter.dart';
import 'package:planner/core/themes/theme_service.dart';
import 'package:planner/core/themes/themes.dart';
import 'package:planner/core/translations/app_translations.dart';
import 'package:planner/core/utils/routes.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/screens/home_screen.dart';
import 'package:planner/src/presentation/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox('settings');
  await Firebase.initializeApp();
  initDep();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final ThemeService service = Get.find<ThemeService>();
  final AuthService authService = Get.find<AuthService>();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('settings');
    final locale = box.get('locale', defaultValue: 'en');
    final darkMode = box.get('isDarkMode', defaultValue: false);

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: Routes.getPages,
        translations: AppTranslations(),
        locale:
          locale == 'en' ? const Locale('en', 'US') : const Locale('uk', 'UA'),
        theme: darkMode ? DarkTheme.orangeTheme : LightTheme.purpleTheme,
        home: Scaffold(
          body: authService.isLoggedIn ? HomeScreen() : OnboardingScreen(),
        ),
      );
  }
}

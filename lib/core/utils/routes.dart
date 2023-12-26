import 'package:get/get.dart';
import 'package:planner/src/presentation/screens/home_screen.dart';
import 'package:planner/src/presentation/screens/login_screen.dart';
import 'package:planner/src/presentation/screens/onboarding_screen.dart';
import 'package:planner/src/presentation/screens/sign_up_screen.dart';

class Routes {
  static String onboard = '/onboard';
  static String login = '/login';
  static String signUp = '/sign-up';
  static String home = '/home';

  static List<GetPage> getPages = [
    GetPage(
      name: onboard,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    )
  ];
}

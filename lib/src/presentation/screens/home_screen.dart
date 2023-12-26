import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/landing_page_controller.dart';
import 'package:planner/src/presentation/widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingPageController controller = Get.find();

    final List<Widget> _screens = [
      Container(
        child: Center(
          child: Text('Tasks'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Add'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Settings'),
        ),
      ),
    ];

    return Obx(
      () => Scaffold(
        body: MainButton(
          text: 'Logout',
          onTap: () => Get.find<AuthService>().logOut(),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(Dimensions.height15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: controller.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

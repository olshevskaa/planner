import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/landing_page_controller.dart';
import 'package:planner/src/presentation/screens/add_task_screen.dart';
import 'package:planner/src/presentation/screens/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final LandingPageController controller = Get.find();
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  void performAction(index) async {
    if (index == 1) {
        await animationController.forward();
      } else {
        await animationController.reverse();
      }
      controller.changeIndex(index);
  }

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    animation =
        Tween<double>(begin: 0, end: pi / 4).animate(animationController);
    scaleAnimation =
        Tween<double>(begin: 1, end: 1.3).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      TasksScreen(),
      AddTaskScreen(),
      Container(
        child: Center(
          child: Text('Settings'),
        ),
      ),
    ];

    return Obx(
      () => Scaffold(
        body: screens[controller.index.value],
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(Dimensions.height15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: performAction,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: animation.value,
                        child: ScaleTransition(
                          scale: scaleAnimation,
                          child: Icon(Icons.add),
                        ),
                      );
                    },
                    // child: Icon(Icons.add),
                  ),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:planner/core/themes/theme_service.dart';
import 'package:planner/core/translations/locale_service.dart';
import 'package:planner/src/data/datasources/auth_remote_data_source.dart';
import 'package:planner/src/data/datasources/task_remote_data_source.dart';
import 'package:planner/src/data/repositories/auth_repo_impl.dart';
import 'package:planner/src/data/repositories/task_repo_impl.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';
import 'package:planner/src/domain/repositories/task_repo.dart';
import 'package:planner/src/domain/usecases/auth/google_auth.dart';
import 'package:planner/src/domain/usecases/auth/login.dart';
import 'package:planner/src/domain/usecases/auth/logout.dart';
import 'package:planner/src/domain/usecases/auth/sign_up.dart';
import 'package:planner/src/domain/usecases/task/add_task.dart';
import 'package:planner/src/domain/usecases/task/complete_task.dart';
import 'package:planner/src/domain/usecases/task/delete_task.dart';
import 'package:planner/src/domain/usecases/task/get_tasks.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/calendar_controller.dart';
import 'package:planner/src/presentation/controllers/landing_page_controller.dart';
import 'package:planner/src/presentation/controllers/task_controller.dart';

void initDep() {
  Get.put(FirebaseAuth.instance);
  Get.put(FirebaseFirestore.instance);

  Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(Get.find(), Get.find()));
  Get.put<TaskRemoteDataSource>(TaskRemoteDataSourceImpl(Get.find()));

  Get.put<AuthRepo>(AuthRepoImpl(Get.find()));
  Get.put<TaskRepo>(TaskRepoImpl(Get.find()));

  Get.put(Login(Get.find()));
  Get.put(SignUp(Get.find()));
  Get.put(Logout(Get.find()));
  Get.put(GoogleAuth(Get.find()));

  Get.put(AddTask(Get.find()));
  Get.put(GetTasks(Get.find()));
  Get.put(CompleteTask(Get.find()));
  Get.put(DeleteTask(Get.find()));

  Get.put(AuthService(
    Get.find(),
    Get.find(),
    Get.find(),
    Get.find(),
    Get.find(),
  ));
  Get.put(ThemeService());
  Get.put(LocaleService());
  Get.put(LandingPageController());
  Get.put(CalendarController());
  Get.put(TaskController(
    Get.find(),
    Get.find(),
    Get.find(),
    Get.find(),
  ));
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:planner/core/themes/theme_service.dart';
import 'package:planner/src/data/datasources/auth_remote_data_source.dart';
import 'package:planner/src/data/repositories/auth_repo_impl.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';
import 'package:planner/src/domain/usecases/auth/google_auth.dart';
import 'package:planner/src/domain/usecases/auth/login.dart';
import 'package:planner/src/domain/usecases/auth/logout.dart';
import 'package:planner/src/domain/usecases/auth/sign_up.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/controllers/landing_page_controller.dart';

void initDep() {
  Get.put(FirebaseAuth.instance);
  Get.put(FirebaseFirestore.instance);

  Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(Get.find(), Get.find()));

  Get.put<AuthRepo>(AuthRepoImpl(Get.find()));

  Get.put(Login(Get.find()));
  Get.put(SignUp(Get.find()));
  Get.put(Logout(Get.find()));
  Get.put(GoogleAuth(Get.find()));

  
  Get.put(AuthService(
    Get.find(),
    Get.find(),
    Get.find(),
    Get.find(),
    Get.find(),
  ));
  Get.put(ThemeService());
  Get.put(LandingPageController());
}

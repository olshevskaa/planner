import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:planner/core/utils/routes.dart';
import 'package:planner/src/data/models/user_model.dart';
import 'package:planner/src/domain/usecases/auth/google_auth.dart';
import 'package:planner/src/domain/usecases/auth/login.dart';
import 'package:planner/src/domain/usecases/auth/logout.dart';
import 'package:planner/src/domain/usecases/auth/sign_up.dart';

class AuthService extends GetxService {
  late Rx<User?> _firebaseUser;
  UserModel? _user;
  final FirebaseAuth _firebaseAuth;
  final SignUp _signUp;
  final Login _login;
  final GoogleAuth _googleAuth;
  final Logout _logout;

  AuthService(
    this._firebaseAuth,
    this._signUp,
    this._login,
    this._googleAuth,
    this._logout,
  );

  bool get isLoggedIn => _firebaseUser.value != null;

  UserModel? get user => _user;

  @override
  void onInit() {
    _firebaseUser = Rx<User?>(_firebaseAuth.currentUser);
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
    _user = Hive.box('settings').get('user');
    super.onInit();
  }

  Future<void> signUp(
    String email,
    String password,
  ) async {
    var result = await _signUp(SignUpParams(
      email: email,
      password: password,
    ));

    result.fold((failure) => Get.snackbar('error'.tr, failure.message),
        (r) {
          _user = r as UserModel;
          Hive.box('settings').put('user', _user);
          Get.offAllNamed(Routes.home);
        });
  }

  Future<void> logOut() async {
    var result = await _logout();
    result.fold((failure) => Get.snackbar('error'.tr, failure.message), (r) {
      _user = null;
      Hive.box('settings').put('user', null);
      Get.offAllNamed(Routes.onboard);
    });
  }

  Future<void> signIn(String email, String password) async {
    var result = await _login(LoginParams(email: email, password: password));

    result.fold((failure) => Get.snackbar('error'.tr, failure.message),
        (r) {
          _user = r as UserModel;
          Hive.box('settings').put('user', _user);
          Get.offAllNamed(Routes.home);
        });
  }

  Future<void> googleAuth() async {
    var result = await _googleAuth();

    result.fold((failure) => Get.snackbar('error'.tr, failure.message), (r) {
      if (r != null) {
        _user = r as UserModel;
        Hive.box('settings').put('user', _user);
        Get.offAllNamed(Routes.home);
      }
    });
  }
}

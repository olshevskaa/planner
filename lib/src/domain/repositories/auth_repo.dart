import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/entities/user.dart';

abstract class AuthRepo {
  ResultFuture<User> signUp({
    required String email,
    required String name,
    required String password,
  });

  ResultFuture<User> login({
    required String email,
    required String password,
  });

  ResultFuture<User?> googleAuth();

  ResultVoid logOut();
}

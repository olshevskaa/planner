import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/entities/user.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';

class Login extends UseCaseWithParams<User, LoginParams> {
  Login(this._repository);

  final AuthRepo _repository;

  @override
  ResultFuture<User> call(LoginParams params) async => await _repository.login(
        email: params.email,
        password: params.password,
      );

  ResultFuture<User> login(LoginParams params) async =>
      await _repository.login(
        email: params.email,
        password: params.password,
      );
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
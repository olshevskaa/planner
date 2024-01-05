import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/entities/user.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';

class SignUp extends UseCaseWithParams<User, SignUpParams> {
  SignUp(this._repository);

  final AuthRepo _repository;

  @override
  ResultFuture<User> call(SignUpParams params) async =>
      await _repository.signUp(
        email: params.email,
        password: params.password,
      );

  ResultFuture<User> signUp({
    required String email,
    required String name,
    required String password,
  }) async =>
      _repository.signUp(
        email: email,
        password: password,
      );
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({
    required this.email,
    required this.password,
  });
}

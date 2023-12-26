import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/entities/user.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';

class GoogleAuth extends UseCaseWithoutParams<void> {
  GoogleAuth(this._repository);

  final AuthRepo _repository;

  @override
  ResultFuture<User?> call() async => await _repository.googleAuth();

  ResultFuture<User?> googleAuth() async => await _repository.googleAuth();
}

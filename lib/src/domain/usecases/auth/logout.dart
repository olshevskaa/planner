import 'package:planner/core/usecase/usecase.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';

class Logout extends UseCaseWithoutParams<void> {
  Logout(this._repository);

  final AuthRepo _repository;

  @override
  ResultVoid call() async => await _repository.logOut();

  ResultVoid logOut() async => await _repository.logOut();
}
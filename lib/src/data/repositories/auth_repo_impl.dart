import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planner/core/errors/exceptions.dart';
import 'package:planner/core/errors/failure.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/data/datasources/auth_remote_data_source.dart';
import 'package:planner/src/data/models/user_model.dart';
import 'package:planner/src/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authDataSource;

  AuthRepoImpl(this._authDataSource);

  @override
  ResultFuture<UserModel?> googleAuth() async {
    try {
      UserModel? user = await _authDataSource.googleAuth();
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromException(e));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid logOut() async {
    try {
      await _authDataSource.logOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromException(e));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserModel> login({required String email, required String password}) async {
    try {
      UserModel user = await _authDataSource.signInWithEmailAndPassword(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromException(e));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserModel> signUp({required String email, required String password}) async {
    try {
      UserModel user =  await _authDataSource.signUpWithEmailAndPassword(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromException(e));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
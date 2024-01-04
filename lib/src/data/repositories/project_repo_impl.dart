import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:planner/core/errors/failure.dart';
import 'package:planner/core/utils/typedef.dart';
import 'package:planner/src/data/datasources/project_remote_data_source.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:planner/src/domain/repositories/project_repo.dart';

class ProjectRepoImpl implements ProjectRepo {
  final ProjectRemoteDataSource _remoteDataSource;

  ProjectRepoImpl(this._remoteDataSource);

  @override
  ResultVoid addProject({
    required String userId,
    required String name,
    String? description,
    Uint8List? cover,
  }) async {
    try {
      await _remoteDataSource.addProject(
        userId: userId,
        name: name,
        description: description,
        cover: cover,
      );
      return const Right(null);
    } catch (e) {
      printError(info: e.toString());
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid deleteProject({
    required String userId,
    required String projectId,
  }) async {
    try {
      await _remoteDataSource.deleteProject(
        userId: userId,
        projectId: projectId,
      );
      return const Right(null);
    } catch (e) {
      printError(info: e.toString());
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid finishProject({
    required String userId,
    required String projectId,
    required bool value,
  }) async {
    try {
      await _remoteDataSource.completeProject(
        userId: userId,
        projectId: projectId,
        value: value,
      );
      return const Right(null);
    } catch (e) {
      printError(info: e.toString());
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ProjectModel>> getProjects({required String userId}) async {
    try {
      final projects = await _remoteDataSource.getProjects(userId: userId);
      return Right(projects);
    } catch (e) {
      printError(info: e.toString());
      return Left(ServerFailure.fromException(e));
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:planner/core/errors/exceptions.dart';
import 'package:planner/src/data/models/project_model.dart';
import 'package:uuid/uuid.dart';

abstract class ProjectRemoteDataSource {
  Future<void> addProject({
    required String userId,
    required String name,
    String? description,
    String? cover,
  });

  Future<List<ProjectModel>> getProjects({required String userId});

  Future<void> completeProject({
    required String userId,
    required String projectId,
    required bool value,
  });

  Future<void> deleteProject({
    required String userId,
    required String projectId,
  });
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProjectRemoteDataSourceImpl(this._firestore);

  @override
  Future<void> addProject({
    required String userId,
    required String name,
    String? description,
    String? cover,
  }) async {
    try {
    final String uid = const Uuid().v4();

    final project = ProjectModel(
      id: uid,
      name: name,
      description: description,
      cover: cover,
      finished: false,
      tasks: [],
    ).toMap();

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('projects')
        .add(project);
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<List<ProjectModel>> getProjects({required String userId}) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .get();

      return snapshot.docs
          .map((doc) => ProjectModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<void> completeProject({
    required String userId,
    required String projectId,
    required bool value,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .doc(projectId)
          .update({'finished': value});
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<void> deleteProject({
    required String userId,
    required String projectId,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .doc(projectId)
          .delete();
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:planner/core/errors/exceptions.dart';
import 'package:planner/src/data/models/task_model.dart';
import 'package:uuid/uuid.dart';

abstract class TaskRemoteDataSource {
  Future<void> addTask(String userId, String title, String date);
  Future<List<TaskModel>> getTasks(String userId);
  Future<void> completeTask(
    String userId,
    String taskId,
    bool value,
  );
  Future<void> deleteTask(String userId, String taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final FirebaseFirestore _firestore;

  TaskRemoteDataSourceImpl(this._firestore);

  @override
  Future<void> addTask(String userId, String title, String date) async {
    try {
      final String id = const Uuid().v4();
      TaskModel task = TaskModel(
        id: id,
        title: title,
        isCompleted: false,
        date: date,
      );

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(id)
          .set(task.toMap());
    } catch (e) {
      throw ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<List<TaskModel>> getTasks(String userId) async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .get();
      return snapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      printError(info: e.toString());
      throw ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<void> completeTask(String userId, String taskId, bool value) async {
    print(value);
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(taskId)
          .update({'isCompleted': value});
    } catch (e) {
      throw ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<void> deleteTask(String userId, String taskId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(taskId)
          .delete();
    } catch (e) {
      throw ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }
}

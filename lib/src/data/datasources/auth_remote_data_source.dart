import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planner/core/errors/exceptions.dart';
import 'package:planner/src/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<UserModel> signUpWithEmailAndPassword(
    String email,
    String name,
    String password,
  );

  Future<UserModel?> googleAuth();

  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl(this._firebaseAuth, this._firestore);

  @override
  Future<UserModel> signUpWithEmailAndPassword(
    String email,
    String name,
    String password,
  ) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        UserModel user = UserModel(
          id: credential.user!.uid,
          email: email,
          tasksCompleted: 0,
          provider: 'email',
        );

        await _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toMap());

        return user;
      } else {
        throw const ServerException(
            message: 'Unexpected error. Please try again', statusCode: 505);
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (credentials.user != null) {
        DocumentSnapshot snapshot = await _firestore
            .collection('users')
            .doc(credentials.user!.uid)
            .get();
        return UserModel.fromMap(snapshot.data()! as Map<String, dynamic>);
      } else {
        throw const ServerException(
            message: 'Unexpected error. Please try again', statusCode: 505);
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<UserModel?> googleAuth() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
        return null;
      }
      
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);

      var doc = await _firestore.collection('users').doc(user.user!.uid).get();
      if (!doc.exists) {
        UserModel userModel = UserModel(
          id: user.user!.uid,
          email: user.user!.email ?? '',
          tasksCompleted: 0,
          provider: 'google',
        );

        await _firestore
            .collection('users')
            .doc(user.user!.uid)
            .set(userModel.toMap());

        
      }
      return UserModel.fromMap(doc.data()!);
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      var user = await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (user['provider'] == 'google') {
        await GoogleSignIn().signOut();
      }
      await _firebaseAuth.signOut();
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      printError(info: e.toString());
      throw const ServerException(
          message: 'Unexpected error. Please try again', statusCode: 505);
    }
  }
}

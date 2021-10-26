// import 'package:firebase_auth/firebase_auth.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/service/flutter/firebase_service.dart';

class AuthRepository {
  final _auth = FirebaseService.auth;

  User getUser() {
    try {
      return User.fromMap({
        'UUID': _auth.currentUser!.uid,
        'email': _auth.currentUser!.email,
        'username': _auth.currentUser!.displayName,
      });
    } catch (e) {
      throw e;
    }
  }

  // Future signInAnon() async {
  //   try {
  //     await _auth.signInAnonymously();
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future signInEmail({
    required User user,
    required String password,
  }) async {
    try {
      // UserCredentical
      await _auth.signInWithEmailAndPassword(
          email: user.email!, password: password);
    } catch (e) {
      throw e;
    }
  }

  Future signUpEmail({
    required User user,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: user.email!, password: password);
      await credential.user!.updateDisplayName(user.username);

      return User.fromMap(user.toMap()).copyWith(UUID: credential.user!.uid);
    } catch (e) {
      throw e;
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }
}

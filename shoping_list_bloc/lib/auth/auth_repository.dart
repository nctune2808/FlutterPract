import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthRepository {
  static final _auth = firebase.FirebaseAuth.instance;
  firebase.User getCurrentUser() {
    try {
      return _auth.currentUser!;
    } catch (e) {
      throw e;
    }
  }

  Future signInAnon() async {
    try {
      await _auth.signInAnonymously();
      // return _fetchUser(credential.user!);
    } catch (e) {
      throw e;
    }
  }

  Future signInEmail({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  Future signUpEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser!.updateDisplayName(username);

      print(_auth.currentUser!.displayName);
    } catch (e) {
      throw e;
    }
  }
}

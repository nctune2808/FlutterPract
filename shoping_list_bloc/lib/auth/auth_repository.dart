import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:shoping_list_bloc/model/user.dart';

class AuthRepository {
  final _auth = firebase.FirebaseAuth.instance;

  User _fetchUser(firebase.User user) {
    return User(userId: user.uid);
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
}

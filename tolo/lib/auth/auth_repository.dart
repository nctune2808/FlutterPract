import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  Future<User> getCurrentUser() async {
    try {
      return _auth.currentUser!;
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

  Future<User> signInEmail(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user!;
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

  Future signOut() async {
    await _auth.signOut();
  }
}

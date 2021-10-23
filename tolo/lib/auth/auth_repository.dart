import 'package:firebase_auth/firebase_auth.dart';
import 'package:tolo/model/user.dart' as tolo;

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

  Future signInEmail({
    required tolo.User user,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: user.email!, password: password);
      return tolo.User.fromMap({
        'UUID': credential.user!.uid,
        'email': credential.user!.email,
        'username': credential.user!.displayName,
      });
    } catch (e) {
      throw e;
    }
  }

  Future signUpEmail({
    required tolo.User user,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: user.email!, password: password);
      await credential.user!.updateDisplayName(user.username);

      return tolo.User.fromMap(user.toMap())
          .copyWith(UUID: credential.user!.uid);
    } catch (e) {
      throw e;
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }
}

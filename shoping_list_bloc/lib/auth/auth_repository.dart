import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoping_list_bloc/service/firebase_service.dart';

class AuthRepository implements FirebaseService {
  final _auth = FirebaseAuth.instance;

  @override
  User getCurrentUser() {
    try {
      return _auth.currentUser!;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future signInAnon() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      throw e;
    }
  }

  @override
  Future signInEmail({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  @override
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

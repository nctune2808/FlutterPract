import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseService {
  User getCurrentUser();

  Future signInAnon();

  Future signInEmail({
    required String email,
    required String password,
  });

  Future signUpEmail({
    required String username,
    required String email,
    required String password,
  });
}

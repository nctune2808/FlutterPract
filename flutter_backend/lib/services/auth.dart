import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_backend/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user based on User

  UserModel? _userFromFirebase(User user) {
    if (user != null) {
      return UserModel(user.uid);
    } else {
      return null;
    }
  }

  // anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      return _userFromFirebase(credential.user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // email

  // register

  // sign out
}

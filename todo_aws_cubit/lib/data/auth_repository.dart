import 'package:amplify_flutter/amplify.dart';

class AuthRepository {
  Future<String> fetchUserId() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      final subAttributes =
          attributes.firstWhere((element) => element.userAttributeKey == 'sub');
      final userId = subAttributes.value;
      return userId;
    } catch (e) {
      throw e;
    }
  }

  Future<String> webSignIn() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI();
      if (result.isSignedIn) {
        return await fetchUserId();
      } else {
        throw Exception("Could not sign in");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<String> attemptAutoSignIn() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        return await fetchUserId();
      } else {
        throw Exception("Not signed in yet");
      }
    } catch (e) {
      throw e;
    }
  }
}

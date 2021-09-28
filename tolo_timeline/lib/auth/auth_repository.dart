class AuthRepository {
  Future<String> attemptAutoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Not Signed In');
  }

  Future<String> signin({
    required String username,
    required String password,
  }) async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }

  Future<void> signUp({
    required String username,
    required String password,
    required String email,
  }) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<String> confirmSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 3));
  }
}

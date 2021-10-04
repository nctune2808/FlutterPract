class AuthRepository {
  Future<String> signin({
    required String username,
    required String password,
  }) async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }
}

class AuthRepository {
  Future<void> signin() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
  }
}

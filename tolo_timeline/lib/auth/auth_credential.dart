class AuthCredential {
  final String username;
  final String? password;
  final String? email;
  String? userId;

  AuthCredential({
    required this.username,
    this.password,
    this.email,
    this.userId,
  });
}

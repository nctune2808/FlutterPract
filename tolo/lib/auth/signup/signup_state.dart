part of 'signup_bloc.dart';

class SignupState {
  final String username;

  final String password;

  final String email;

  final Status status;

  SignupState({
    this.username = '',
    this.password = '',
    this.email = '',
    this.status = const StatusInitial(),
  });

  SignupState copyWith({
    String? username,
    String? password,
    String? email,
    Status? status,
  }) {
    return SignupState(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }
}

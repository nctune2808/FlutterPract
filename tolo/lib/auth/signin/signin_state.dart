part of 'signin_bloc.dart';

class SigninState {
  final String email;
  final String password;
  final Status status;

  SigninState(
      {this.email = '',
      this.password = '',
      this.status = const StatusInitial()});

  SigninState copyWith({
    String? email,
    String? password,
    Status? status,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}

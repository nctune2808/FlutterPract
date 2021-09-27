part of 'signin_bloc.dart';

class SigninState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  SigninState(
      {this.username = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  SigninState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SigninState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

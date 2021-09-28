part of 'signup_bloc.dart';

class SignupState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String email;
  bool get isValidEmail => email.contains('@');

  final FormSubmissionStatus formStatus;

  SignupState({
    this.username = '',
    this.password = '',
    this.email = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? username,
    String? password,
    String? email,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

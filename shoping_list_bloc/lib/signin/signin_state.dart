part of 'signin_bloc.dart';

class SigninState {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  SigninState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  SigninState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

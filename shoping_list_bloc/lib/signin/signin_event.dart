part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninUsername extends SigninEvent {
  final String username;
  SigninUsername({
    required this.username,
  });
}

class SigninEmail extends SigninEvent {
  final String email;
  SigninEmail({
    required this.email,
  });
}

class SigninPassword extends SigninEvent {
  final String password;
  SigninPassword({
    required this.password,
  });
}

class SigninSubmitted extends SigninEvent {}

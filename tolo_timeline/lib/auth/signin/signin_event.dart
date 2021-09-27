part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninUsername extends SigninEvent {
  final String username;
  SigninUsername({
    required this.username,
  });
}

class SigninPassword extends SigninEvent {
  final String password;
  SigninPassword({
    required this.password,
  });
}

class SigninSubmitted extends SigninEvent {}

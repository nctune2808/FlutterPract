part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupUsername extends SignupEvent {
  final String username;
  SignupUsername({
    required this.username,
  });
}

class SignupPassword extends SignupEvent {
  final String password;
  SignupPassword({
    required this.password,
  });
}

class SignupEmail extends SignupEvent {
  final String email;
  SignupEmail({
    required this.email,
  });
}

class SignupSubmitted extends SignupEvent {}

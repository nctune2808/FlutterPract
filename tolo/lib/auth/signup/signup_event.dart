part of 'signup_bloc.dart';

abstract class SignupEvent {}

class UsernameSignupEvent extends SignupEvent {
  final String username;
  UsernameSignupEvent({
    required this.username,
  });
}

class PasswordSignupEvent extends SignupEvent {
  final String password;
  PasswordSignupEvent({
    required this.password,
  });
}

class EmailSignupEvent extends SignupEvent {
  final String email;
  EmailSignupEvent({
    required this.email,
  });
}

class SubmissionSignupEvent extends SignupEvent {}

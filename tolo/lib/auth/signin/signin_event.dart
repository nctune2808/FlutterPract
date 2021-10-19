part of 'signin_bloc.dart';

abstract class SigninEvent {}

class UsernameSigninEvent extends SigninEvent {
  final String username;
  UsernameSigninEvent({
    required this.username,
  });
}

class EmailSigninEvent extends SigninEvent {
  final String email;
  EmailSigninEvent({
    required this.email,
  });
}

class PasswordSigninEvent extends SigninEvent {
  final String password;
  PasswordSigninEvent({
    required this.password,
  });
}

class SubmissionSigninEvent extends SigninEvent {}

class FastTrackSignInEvent extends SigninEvent {}

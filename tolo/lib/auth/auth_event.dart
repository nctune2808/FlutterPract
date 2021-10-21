part of 'auth_bloc.dart';

abstract class AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class SignInAuthEvent extends AuthEvent {}

class SignUpAuthEvent extends AuthEvent {}

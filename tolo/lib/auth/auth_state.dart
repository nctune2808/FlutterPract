part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthSignInState extends AuthState {}

class AuthSignUpState extends AuthState {}

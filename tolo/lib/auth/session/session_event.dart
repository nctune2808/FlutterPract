part of 'session_bloc.dart';

abstract class SessionEvent {}

class InitSessionEvent extends SessionEvent {}

class SignInSessionEvent extends SessionEvent {}

class SignUpSessionEvent extends SessionEvent {}

class ConfirmSessionEvent extends SessionEvent {}

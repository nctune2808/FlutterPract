part of 'session_bloc.dart';

abstract class SessionEvent {}

class InitSessionEvent extends SessionEvent {}

class UnauthSessionEvent extends SessionEvent {}

class AuthenSessionEvent extends SessionEvent {}

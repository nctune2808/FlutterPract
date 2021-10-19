part of 'session_bloc.dart';

abstract class SessionState {}

class SessionInitState extends SessionState {}

class UnauthSessionState extends SessionState {}

class AuthenSessionState extends SessionState {}

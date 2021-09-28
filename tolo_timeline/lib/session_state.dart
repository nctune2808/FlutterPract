abstract class SessionState {}

class UnknownSession extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  final dynamic user;

  Authenticated({
    required this.user,
  });
}

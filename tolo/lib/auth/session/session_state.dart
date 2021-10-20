part of 'session_bloc.dart';

class SessionState {
  User? user;
  Status? status;

  SessionState({
    this.user,
    this.status = const StatusInitial(),
  });

  SessionState copyWith({
    User? user,
    Status? status,
  }) {
    return SessionState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}

class SessionInitState extends SessionState {}

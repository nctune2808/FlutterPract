abstract class Status {
  const Status();
}

class StatusInitial extends Status {
  const StatusInitial();
}

class StatusLoading extends Status {}

class StatusSucess extends Status {}

class StatusFailed extends Status {
  final dynamic e;
  StatusFailed({
    required this.e,
  });
}

class StatusUnauthenticated extends Status {}

class StatusAuthenticated extends Status {}

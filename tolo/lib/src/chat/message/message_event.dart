part of 'message_bloc.dart';

abstract class MessageEvent {}

class SentMessageEvent extends MessageEvent {
  Message message;
  SentMessageEvent({
    required this.message,
  });
}

class AuthMessageEvent extends MessageEvent {
  User user;
  AuthMessageEvent({
    required this.user,
  });
}

class InitMessageEvent extends MessageEvent {}

class LoadMessageEvent extends MessageEvent {
  Message message;
  LoadMessageEvent({
    required this.message,
  });
}

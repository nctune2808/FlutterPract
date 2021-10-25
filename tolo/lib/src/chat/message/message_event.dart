part of 'message_bloc.dart';

abstract class MessageEvent {}

class SentMessageEvent extends MessageEvent {
  Message message;
  SentMessageEvent({
    required this.message,
  });
}

class InitMessageEvent extends MessageEvent {}

class LoadMessageEvent extends MessageEvent {
  Message message;
  LoadMessageEvent({
    required this.message,
  });
}

class UpdateMessageEvent extends MessageEvent {
  Message message;
  UpdateMessageEvent({
    required this.message,
  });
}

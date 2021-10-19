part of 'message_bloc.dart';

abstract class MessageEvent {}

class SentMessageEvent extends MessageEvent {
  Message message;
  SentMessageEvent({
    required this.message,
  });
}

class InitMessageEvent extends MessageEvent {}

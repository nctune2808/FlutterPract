part of 'talk_bloc.dart';

class TalkEvent {}

class LoadingMessageEvent extends TalkEvent {}

class SentMessageEvent extends TalkEvent {
  String message;
  SentMessageEvent({
    required this.message,
  });
}

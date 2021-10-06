part of 'talk_bloc.dart';

@immutable
abstract class TalkEvent {}

class LoadingMessageEvent extends TalkEvent {}

class SentMessageEvent extends TalkEvent {
  Message message;
  SentMessageEvent({
    required this.message,
  });
}

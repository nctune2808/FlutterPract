part of 'message_bloc.dart';

class MessageState {
  final Message? message;
  final Status? status;

  MessageState({
    this.message,
    this.status = const StatusInitial(),
  });

  MessageState copyWith({
    Message? message,
    Status? status,
  }) {
    return MessageState(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

class MessageInitState extends MessageState {}

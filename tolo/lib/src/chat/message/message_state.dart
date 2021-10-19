part of 'message_bloc.dart';

class MessageState {
  final String sender;
  final String text;
  final FormSubmissionStatus formStatus;

  MessageState({
    this.sender = '',
    this.text = '',
    this.formStatus = const InitialFormStatus(),
  });

  MessageState copyWith({
    String? sender,
    String? text,
    FormSubmissionStatus? formStatus,
  }) {
    return MessageState(
      sender: sender ?? this.sender,
      text: text ?? this.text,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class MessageInitState extends MessageState {}

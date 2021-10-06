part of 'talk_bloc.dart';

class TalkState {
  final String sender;
  final String text;
  final FormSubmissionStatus formStatus;

  TalkState({
    this.sender = '',
    this.text = '',
    this.formStatus = const InitialFormStatus(),
  });

  TalkState copyWith({
    String? sender,
    String? text,
    FormSubmissionStatus? formStatus,
  }) {
    return TalkState(
      sender: sender ?? this.sender,
      text: text ?? this.text,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class InitialMessage extends TalkState {}

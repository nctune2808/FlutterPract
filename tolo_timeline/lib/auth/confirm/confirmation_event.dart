part of 'confirmation_bloc.dart';

@immutable
abstract class ConfirmationEvent {}

class ConfirmationCode extends ConfirmationEvent {
  final String code;
  ConfirmationCode({
    required this.code,
  });
}

class ConfirmationSubmitted extends ConfirmationEvent {}

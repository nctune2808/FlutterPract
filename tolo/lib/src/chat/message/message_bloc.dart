import 'package:bloc/bloc.dart';
import 'package:tolo/model/message.dart';
import 'package:tolo/src/chat/message/message_repository.dart';
import 'package:tolo/utility/state/form_submission_status.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitState());
  MessageRepository _msgRepo = MessageRepository();

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is SentMessageEvent) {
      yield state.copyWith(formStatus: Submitting());
      try {
        await _msgRepo.enterMessage(message: event.message);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

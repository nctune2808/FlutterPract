import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tolo/model/message.dart';
import 'package:tolo/src/chat/message/message_repository.dart';
import 'package:tolo/utility/state/status.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitState());
  MessageRepository _msgRepo = MessageRepository();

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is LoadMessageEvent) {
      yield state.copyWith(status: StatusSucess(), message: event.message);
    }
    if (event is SentMessageEvent) {
      yield state.copyWith(status: StatusLoading());
      try {
        await _msgRepo.enterMessage(message: event.message);
        yield state.copyWith(status: StatusSucess(), message: event.message);
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }
  }
}

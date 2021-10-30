import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tolo/src/chat/chat_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitState());
  ChatRepository _chatRepo = ChatRepository();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is FetchChatEvent) {
      yield state.copyWith(status: StatusLoading());
      try {
        // await _chatRepo.getMessages();
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }
  }
}

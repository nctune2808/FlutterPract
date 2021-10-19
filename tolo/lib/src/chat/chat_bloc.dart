import 'package:bloc/bloc.dart';
import 'package:tolo/src/chat/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState());
  ChatRepository _chatRepo = ChatRepository();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is InitChatEvent) {
      _chatRepo.getMessages();
      yield ChatInitState();
    }
  }
}

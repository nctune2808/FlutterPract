import 'package:bloc/bloc.dart';
import 'package:shoping_list_bloc/model/message.dart';
import 'package:shoping_list_bloc/src/talk/talk_repository.dart';
import 'package:shoping_list_bloc/utility/state/form_submission_status.dart';

part 'talk_event.dart';
part 'talk_state.dart';

class TalkBloc extends Bloc<TalkEvent, TalkState> {
  TalkBloc() : super(TalkState());

  TalkRepository _talkRepo = TalkRepository();

  @override
  Stream<TalkState> mapEventToState(TalkEvent event) async* {
    if (event is LoadingMessageEvent) {
      _talkRepo.getMessages();
      yield InitialMessage();
    }

    if (event is SentMessageEvent) {
      yield state.copyWith(formStatus: Submitting());
      try {
        await _talkRepo.enterMessage(message: event.message);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

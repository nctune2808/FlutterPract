import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/model/message.dart';
import 'package:shoping_list_bloc/talk/talk_repository.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';

part 'talk_event.dart';
part 'talk_state.dart';

class TalkBloc extends Bloc<TalkEvent, TalkState> {
  TalkBloc() : super(TalkState());
  TalkRepository _talkRepo = TalkRepository();

  @override
  Stream<TalkState> mapEventToState(TalkEvent event) async* {
    if (event is SentMessageEvent) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        await _talkRepo.enterMessage(
            text: event.message.text, sender: event.message.sender);
        yield state.copyWith(formStatus: SubmissionSucess());
        await _talkRepo.streamMessages();
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

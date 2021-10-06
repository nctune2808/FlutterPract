import 'package:bloc/bloc.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/talk/talk_repository.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';

part 'talk_event.dart';
part 'talk_state.dart';

class TalkBloc extends Bloc<TalkEvent, TalkState> {
  TalkBloc() : super(TalkState());

  AuthRepository _authRepo = AuthRepository();
  TalkRepository _talkRepo = TalkRepository();

  @override
  Stream<TalkState> mapEventToState(TalkEvent event) async* {
    print(event.toString());

    if (event is LoadingMessageEvent) {
      yield InitialMessage();
    } else if (event is SentMessageEvent) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        await _talkRepo.enterMessage(
            text: event.message,
            sender: _authRepo.getCurrentUser().displayName!);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

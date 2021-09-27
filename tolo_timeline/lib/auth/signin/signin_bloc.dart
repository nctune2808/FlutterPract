import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tolo_timeline/auth/auth_repository.dart';
import 'package:tolo_timeline/auth/form_submission_status.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepo;

  SigninBloc({
    required this.authRepo,
  }) : super(SigninState());

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninUsername) {
      yield state.copyWith(username: event.username);
    } else if (event is SigninPassword) {
      yield state.copyWith(password: event.password);
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.signin();
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

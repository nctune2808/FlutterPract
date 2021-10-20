import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/utility/state/form_submission_status.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState());
  AuthRepository _authRepo = AuthRepository();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is EmailSigninEvent) {
      yield state.copyWith(email: event.email);
    } else if (event is PasswordSigninEvent) {
      yield state.copyWith(password: event.password);
    } else if (event is SubmissionSigninEvent) {
      yield state.copyWith(formStatus: Submitting());
      try {
        await _authRepo.signInEmail(
            email: state.email, password: state.password);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
        yield state.copyWith(formStatus: InitialFormStatus());
      }
    } else if (event is FastTrackSignInEvent) {
      yield state.copyWith(formStatus: Submitting());
      try {
        await _authRepo.signInAnon();
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

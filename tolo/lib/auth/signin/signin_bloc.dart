import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/utility/state/status.dart';
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
      yield state.copyWith(status: StatusLoading());
      try {
        User user = await _authRepo.signInEmail(
            email: state.email, password: state.password);
        print(user);
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
        yield state.copyWith(status: StatusInitial());
      }
    } else if (event is FastTrackSignInEvent) {
      yield state.copyWith(status: StatusLoading());
      try {
        await _authRepo.signInAnon();
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }
  }
}

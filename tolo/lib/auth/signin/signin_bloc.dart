import 'package:bloc/bloc.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/auth/session/session_repository.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/utility/state/status.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState());
  AuthRepository _authRepo = AuthRepository();
  final _ssRepo = SessionRepository.instance;

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is EmailSigninEvent) {
      yield state.copyWith(email: event.email);
    } else if (event is PasswordSigninEvent) {
      yield state.copyWith(password: event.password);
    } else if (event is SubmissionSigninEvent) {
      yield state.copyWith(status: StatusLoading());
      try {
        await _authRepo.signInEmail(
          user: User(email: state.email),
          password: state.password,
        );
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
        yield state.copyWith(status: StatusInitial());
      }
    } else if (event is FastTrackSignInEvent) {
      yield state.copyWith(status: StatusLoading());
      try {
        await _ssRepo.retrieveUserById(
          user: await _authRepo.signInEmail(
            user: User(email: "admin@tolo.com"),
            password: "zxcvbnm",
          ),
        );
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
        yield state.copyWith(status: StatusInitial());
      }
    }
  }
}

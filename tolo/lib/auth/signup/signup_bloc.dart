import 'package:bloc/bloc.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/auth/session/session_repository.dart';
import 'package:tolo/model/photo.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/utility/state/status.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState());
  AuthRepository _authRepo = AuthRepository();
  final _ssRepo = SessionRepository.instance;
  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is UsernameSignupEvent) {
      yield state.copyWith(username: event.username);
    } else if (event is PasswordSignupEvent) {
      yield state.copyWith(password: event.password);
    } else if (event is EmailSignupEvent) {
      yield state.copyWith(email: event.email);
    } else if (event is SubmissionSignupEvent) {
      yield state.copyWith(status: StatusLoading());
      try {
        // validating user first
        User signUpUser = await _authRepo.signUpEmail(
            user: User(email: state.email, username: state.username),
            password: state.password);
        Photo avatar = await _ssRepo.insertEmptyAvatar(); // additional params

        final newUser = signUpUser.copyWith(avatar_id: avatar.id);

        await _ssRepo.insertUser(user: newUser);

        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
        yield state.copyWith(status: StatusInitial());
      }
    }
  }
}

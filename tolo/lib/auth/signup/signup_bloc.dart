import 'package:bloc/bloc.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState());
  AuthRepository _authRepo = AuthRepository();

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
        final newUser = await _authRepo.signUpEmail(
            email: state.email,
            password: state.password,
            username: state.username);
        yield state.copyWith(status: StatusSucess());
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
        yield state.copyWith(status: StatusInitial());
      }
      // try {
      //   await authRepo.signUp(
      //     username: state.username,
      //     password: state.password,
      //     email: state.email,
      //   );
      //   yield state.copyWith(formStatus: SubmissionSucess());

      //   authCubit.showConfirmSignUp(
      //     username: state.username,
      //     password: state.password,
      //     email: state.email,
      //   );
      // } catch (e) {
      //   print(e);
      //   yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      // }
    }
  }
}

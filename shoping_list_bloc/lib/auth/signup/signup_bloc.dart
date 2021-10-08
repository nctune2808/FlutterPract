import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/utility/state/form_submission_status.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState());
  AuthRepository _authRepo = AuthRepository();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupUsername) {
      yield state.copyWith(username: event.username);
    } else if (event is SignupPassword) {
      yield state.copyWith(password: event.password);
    } else if (event is SignupEmail) {
      yield state.copyWith(email: event.email);
    } else if (event is SignupSubmitted) {
      yield state.copyWith(formStatus: Submitting());
      try {
        final newUser = await _authRepo.signUpEmail(
            email: state.email,
            password: state.password,
            username: state.username);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
        yield state.copyWith(formStatus: InitialFormStatus());
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

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState());
  AuthRepository _authRepo = AuthRepository();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninEmail) {
      yield state.copyWith(email: event.email);
    } else if (event is SigninPassword) {
      yield state.copyWith(password: event.password);
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        await _authRepo.signInEmail(
            email: state.email, password: state.password);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
      // try {
      //   final userId = await authRepo.signin(
      //     username: state.username,
      //     password: state.password,
      //   );
      //   yield state.copyWith(formStatus: SubmissionSucess());

      //   authCubit.launchSession(
      //     AuthCredential(username: state.username, userId: userId),
      //   );
      // } catch (e) {
      //   print(e);
      //   yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      // }
    } else if (event is FastTrackSubmitted) {
      yield state.copyWith(formStatus: AdminSubmitting());
      try {
        await _authRepo.signInAnon();
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

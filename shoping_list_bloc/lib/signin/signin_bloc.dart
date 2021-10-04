import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState());

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninUsername) {
      yield state.copyWith(username: event.username);
    } else if (event is SigninPassword) {
      yield state.copyWith(password: event.password);
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

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
    }
  }
}

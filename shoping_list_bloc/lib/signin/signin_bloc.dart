import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState());
  final _auth = FirebaseAuth.instance;
  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninEmail) {
      yield state.copyWith(email: event.email);
    } else if (event is SigninPassword) {
      yield state.copyWith(password: event.password);
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: state.email, password: state.password);
        print(state.email);
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
    }
  }
}

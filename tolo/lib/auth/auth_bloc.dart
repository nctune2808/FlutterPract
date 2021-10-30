import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      // this.sessionBloc,
      )
      : super(AuthInitState());

  // final SessionBloc sessionBloc;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInAuthEvent) {
      yield AuthSignInState();
    }

    if (event is SignUpAuthEvent) {
      yield AuthSignUpState();
    }

    // if (event is LaunchAuthSessionEvent) {
    //   sessionBloc.
    // }
  }
}

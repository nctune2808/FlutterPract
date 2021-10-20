import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/utility/state/Status.dart';
part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitState());
  AuthRepository _authRepo = AuthRepository();

  @override
  Stream<SessionState> mapEventToState(SessionEvent event) async* {
    String token = "";
    if (event is UnauthSessionEvent) {
      // need condition
      await _authRepo.signOut();
      yield state.copyWith(status: StatusUnauthenticated());
      // } else {
      //   yield state.copyWith(status: StatusInitial());
      // }
    }

    if (event is AuthenSessionEvent) {
      User user = await _authRepo.getCurrentUser();
      token = await user.getIdToken();
      yield state.copyWith(status: StatusAuthenticated(), user: user);
    }
  }
}

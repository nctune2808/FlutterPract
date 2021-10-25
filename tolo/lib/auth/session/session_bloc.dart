import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/auth/session/session_repository.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/utility/state/status.dart';
part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitState());
  AuthRepository _authRepo = AuthRepository();
  final _ssRepo = SessionRepository.instance;

  @override
  Stream<SessionState> mapEventToState(SessionEvent event) async* {
    // String token = "";

    if (event is InitSessionEvent) {
      yield SessionInitState();
    }

    if (event is UnauthSessionEvent) {
      // need condition
      await _authRepo.signOut();
      yield state.copyWith(status: StatusUnauthenticated());
      // } else {
      //   yield state.copyWith(status: StatusInitial());
      // }
    }

    if (event is AuthenSessionEvent) {
      User user =
          await _ssRepo.retrieveUserById(user: await _authRepo.getUser());
      // token = await user.getIdToken();
      yield state.copyWith(status: StatusAuthenticated(), user: user);
    }

    // if (event is LaunchSessionEvent) {
    //   tolo.User user =
    //       await _ssRepo.retrieveUserById(user: await _authRepo.getUser());
    //   yield state.copyWith(status: StatusAuthenticated(), toloUser: user);
    // }
  }
}

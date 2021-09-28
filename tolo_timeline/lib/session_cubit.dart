import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tolo_timeline/auth/auth_credential.dart';
import 'package:tolo_timeline/auth/auth_repository.dart';
import 'package:tolo_timeline/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  SessionCubit({
    required this.authRepo,
  }) : super(UnknownSession()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRepo.attemptAutoLogin();
      // final user = dataRepo.getUser(userId);
      final user = userId;
      emit(Authenticated(user: user));
    } catch (e) {
      print(e);
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredential credential) {
    final user = credential.username;
    emit(Authenticated(user: user));
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}

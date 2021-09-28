import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tolo_timeline/auth/auth_credential.dart';
import 'package:tolo_timeline/session_cubit.dart';

enum AuthState { signin, signup, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  // initial state
  AuthCubit({
    required this.sessionCubit,
  }) : super(AuthState.signin);

  late AuthCredential credential;

  void showSignIn() => emit(AuthState.signin);
  void showSignUp() => emit(AuthState.signup);
  void showConfirmSignUp({
    required String username,
    required String password,
    required String email,
  }) {
    credential = AuthCredential(
      username: username,
      password: password,
      email: email,
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredential credential) =>
      sessionCubit.showSession(credential);
}

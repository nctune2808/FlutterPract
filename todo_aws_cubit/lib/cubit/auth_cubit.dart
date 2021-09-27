import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_aws_cubit/data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authRepo = AuthRepository();

  AuthCubit() : super(UnknownAuth());

  void signIn() async {
    try {
      final userId = await _authRepo.webSignIn();
      if (userId != null && userId.isNotEmpty) {
        emit(Authenticated(userId: userId));
        print("auth");
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      print(e);
      emit(Unauthenticated());
    }
  }

  void signOut() async {
    try {
      await _authRepo.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void autoSignIn() async {
    try {
      final userId = await _authRepo.attemptAutoSignIn();
      if (userId != null && userId.isNotEmpty) {
        emit(Authenticated(userId: userId));
      } else {
        emit(Unauthenticated());
      }
    } on Exception {
      emit(Unauthenticated());
    }
  }
}

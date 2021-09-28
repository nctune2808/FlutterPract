import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tolo_timeline/auth/auth_cubit.dart';
import 'package:tolo_timeline/auth/auth_repository.dart';
import 'package:tolo_timeline/auth/form_submission_status.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ConfirmationBloc({
    required this.authRepo,
    required this.authCubit,
  }) : super(ConfirmationState());

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    if (event is ConfirmationCode) {
      yield state.copyWith(code: event.code);
    } else if (event is ConfirmationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepo.confirmSignUp(
          username: authCubit.credential.username,
          confirmationCode: state.code,
        );
        print(userId);
        yield state.copyWith(formStatus: SubmissionSucess());

        final credential = authCubit.credential;
        credential.userId = userId;
        print(credential);

        authCubit.launchSession(credential);
      } catch (e) {
        print(e);
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

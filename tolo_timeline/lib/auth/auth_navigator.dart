import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo_timeline/auth/signin/signin_view.dart';
import 'package:tolo_timeline/auth/signup/signup_view.dart';

import 'auth_cubit.dart';
import 'confirm/confirmation_view.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state == AuthState.signin) MaterialPage(child: SignInView()),
            if (state == AuthState.signup) MaterialPage(child: SignUpView()),
            if (state == AuthState.confirmSignUp)
              MaterialPage(child: ConfirmationView()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }
}

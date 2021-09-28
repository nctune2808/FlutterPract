import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo_timeline/auth/auth_cubit.dart';
import 'package:tolo_timeline/auth/auth_navigator.dart';
import 'package:tolo_timeline/loading_view.dart';
import 'package:tolo_timeline/session_view.dart';

import 'session_cubit.dart';
import 'session_state.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state is UnknownSession) MaterialPage(child: LoadingView()),
            if (state is Unauthenticated)
              MaterialPage(
                child: BlocProvider(
                  create: (context) =>
                      AuthCubit(sessionCubit: context.read<SessionCubit>()),
                  child: AuthNavigator(),
                ),
              ),
            if (state is Authenticated) MaterialPage(child: SessionView()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }
}

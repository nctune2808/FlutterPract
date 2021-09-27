import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_aws_cubit/auth_view.dart';
import 'package:todo_aws_cubit/cubit/todo_cubit.dart';
import 'package:todo_aws_cubit/loading_view.dart';
import 'package:todo_aws_cubit/todo_view.dart';

import 'cubit/auth_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state is Unauthenticated) MaterialPage(child: AuthView()),
            if (state is Authenticated)
              MaterialPage(
                  child: BlocProvider(
                create: (context) => TodoCubit(userId: state.userId)
                  ..getListTodo()
                  ..observeTodo(),
                child: TodosView(),
              )),
            if (state is UnknownAuth) MaterialPage(child: LoadingView()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }
}

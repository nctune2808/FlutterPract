import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo_timeline/auth/auth_navigator.dart';

import 'app_navigator.dart';
import 'auth/auth_repository.dart';
import 'session_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) =>
              SessionCubit(authRepo: context.read<AuthRepository>()),
          child: AppNavigator(),
        ),
      ),
    );
  }
}

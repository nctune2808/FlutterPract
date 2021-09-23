import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/app_navigator.dart';

import 'nav_bloc.dart';
import 'post_bloc.dart';
import 'post_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PostsBloc>(
            create: (context) => PostsBloc()
              ..add(LoadPostsEvent()), // get instance by double dot cascade..
          ),
          // BlocProvider<NavBloc>(
          //   create: (context) => NavBloc()..add(LoadNavEvent()),
          // ),
        ],
        child: PostsView(),
      ),
    );
  }
}

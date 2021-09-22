import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_cubit.dart';
import 'post_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostsCubit>(
        create: (context) =>
            PostsCubit()..getPosts(), // get instance by double dot cascade..
        child: PostsView(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/post.dart';
import 'package:post_bloc/post_bloc.dart';
import 'package:post_bloc/post_details.dart';
import 'package:post_bloc/post_view.dart';

import 'nav_bloc.dart';

// class AppNavigator extends StatelessWidget {
//   final Post post;
//   const AppNavigator({Key? key, required this.post}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       pages: [
//         MaterialPage(child: PostsView()),
//         if (post != null)
//           MaterialPage(
//             child: PostDetails(
//               post: post,
//             ),
//           )
//       ],
//       // onPopPage: (route, result) {},
//     );
//   }
// }

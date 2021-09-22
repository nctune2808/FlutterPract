import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post.dart';
import 'post_cubit.dart';

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      // which provider and which type
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(posts[index].title),
              ),
            );
          });
        },
      ),
    );
  }
}

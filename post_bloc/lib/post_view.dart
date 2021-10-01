import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/post_details.dart';

import 'post_bloc.dart';

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      // which provider and which type
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          // when loading return indicator
          if (state is LoadingPostsState) {
            return Center(
              child: CircularProgressIndicator(),
            );

            // when loaded return view
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              // refreshed to call pullRefreshEvent
              // wrapped by BlocProvider of current PostsBloc
              // add event
              onRefresh: () async =>
                  BlocProvider.of<PostsBloc>(context).add(PullToRefreshEvent()),

              // Set limit of posts length
              // Set list builder through state
              child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.posts[index].title),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return PostDetails(post: state.posts[index]);
                            }),
                          );
                        },
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            BlocProvider.of<PostsBloc>(context)
                                .add(DeletePostEvent(post: state.posts[index]));
                          },
                        ),
                      ),
                    );
                  }),
            );

            // when failed return error
          } else if (state is FailToLoadPostsState) {
            return Center(
              child: Text('Error occured: ${state.err}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

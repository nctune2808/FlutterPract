// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/timeline/post/post_bloc.dart';
import 'package:tolo/src/timeline/post/post_view.dart';
import 'package:tolo/src/timeline/timeline_bloc.dart';
import 'package:tolo/src/timeline/timeline_bloc.dart';
import 'package:tolo/src/timeline/timeline_repository.dart';
import 'package:tolo/utility/state/Status.dart';
import 'package:tolo/utility/state/form_submission_status.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({Key? key}) : super(key: key);

  @override
  _TimelineViewState createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  List<Post> posts = [];
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline")),
      body: BlocBuilder<TimelineBloc, TimelineState>(
        builder: (context, state) {
          return BlocBuilder<PostBloc, PostState>(
            builder: (context, pState) {
              // if (state is TimelineStreaming) {
              //   return _streamBuilder(state.stream!);
              if (state.status is StatusSucess) {
                posts = state.posts!;
                return _sceneBuilder(posts);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      floatingActionButton: _floatingButton(),
    );
  }

  Widget _sceneBuilder(List<Post> posts) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TimelineBloc>().add(FetchTimelineEvent());
        await Future.delayed(Duration(seconds: 1));
      },
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostView(post: posts[index]);
        },
      ),
    );
  }

  Widget _groupTextField() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: 'Add something new?'),
          controller: _titleController,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Add body text?'),
          controller: _bodyController,
        ),
      ],
    );
  }

  Widget _addPostButton() {
    return ElevatedButton(
      onPressed: () {
        Post addPost = Post(
          title: _titleController.text,
          body: _bodyController.text,
        );
        context.read<PostBloc>().add(AddPostEvent(post: addPost));

        context.read<TimelineBloc>().add(FetchTimelineEvent());

        Navigator.pop(context);
        _titleController.clear();
        _bodyController.clear();
      },
      child: Text('Publish'),
    );
  }

  Widget _floatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                _groupTextField(),
                _addPostButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }
}

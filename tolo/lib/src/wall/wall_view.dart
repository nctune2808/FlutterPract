import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/home/loading_view.dart';
import 'package:tolo/src/wall/post/post_bloc.dart';
import 'package:tolo/src/wall/post/post_view.dart';
import 'package:tolo/src/wall/wall_bloc.dart';
import 'package:tolo/utility/state/status.dart';

class WallView extends StatefulWidget {
  const WallView({Key? key}) : super(key: key);

  @override
  _WallViewState createState() => _WallViewState();
}

class _WallViewState extends State<WallView> {
  List<Post> posts = [];
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wall")),
      body: BlocBuilder<WallBloc, WallState>(
        builder: (context, state) {
          if (state.status is StatusSucess) {
            posts = state.posts!;
            return _sceneBuilder(posts);
          } else {
            return LoadingView();
          }
        },
      ),
      floatingActionButton: _floatingButton(),
    );
  }

  Widget _sceneBuilder(List<Post> posts) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<WallBloc>().add(FetchWallEvent());
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
        context.read<WallBloc>().add(FetchWallEvent());

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

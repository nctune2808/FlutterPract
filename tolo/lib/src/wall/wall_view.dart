import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/model/wall.dart';
import 'package:tolo/src/home/loading_view.dart';
import 'package:tolo/src/wall/post/post_bloc.dart';
import 'package:tolo/src/wall/post/post_view.dart';
import 'package:tolo/src/wall/wall_bloc.dart';
import 'package:tolo/utility/function/covert.dart';
import 'package:tolo/utility/state/status.dart';

class WallView extends StatefulWidget {
  const WallView({Key? key}) : super(key: key);

  @override
  _WallViewState createState() => _WallViewState();
}

class _WallViewState extends State<WallView> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wall")),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          print("--WallSession:-- ${state.status}");
          return BlocBuilder<WallBloc, WallState>(
            builder: (context, state) {
              if (state.status is StatusSucess) {
                if (state.walls!.isEmpty) {
                  return Center(child: Text("No Post!"));
                }
                return _sceneBuilder(state.walls!);
              } else {
                return LoadingView();
              }
            },
          );
        },
      ),
      floatingActionButton: _floatingButton(),
    );
  }

  Widget _sceneBuilder(List<Wall> walls) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<WallBloc>().add(FetchWallEvent());
        await Future.delayed(Duration(seconds: 1));
      },
      child: ListView.builder(
        reverse: false,
        shrinkWrap: true,
        itemCount: walls.length,
        itemBuilder: (BuildContext context, int index) {
          return _wallBuilder(wall: walls[index]);
        },
      ),
    );
  }

  Widget _wallBuilder({required Wall wall}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 3,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerBuilder(wall: wall),
            Divider(height: 0, thickness: 1, color: Colors.grey[200]),
            PostView(post: wall.post!),
            Divider(height: 0, thickness: 1, color: Colors.grey[200]),
            _footerBuilder(wall: wall),
          ],
        ),
      ),
    );
  }

  Widget _headerBuilder({required Wall wall}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          " ${readTime(wall.created_at!)}",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          textAlign: TextAlign.right,
        ),
        CupertinoContextMenu(
            previewBuilder: (context, animation, child) {
              return Container(color: Colors.lightBlueAccent);
            },
            actions: [
              _contextAction(type: wall.user!.username!),
              _contextAction(type: wall.user!.email!),
              _contextAction(type: wall.user!.UUID!),
            ],
            child: Icon(Icons.person)),
        PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(child: Text("Delete"), value: "/delete"),
          ],
          onSelected: (route) {
            // Navigator.pushNamed(context, route);
          },
        ),
      ],
    );
  }

  Widget _contextAction({required String type}) {
    return CupertinoContextMenuAction(
      child: Center(
        child: Text(
          type,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 15),
        ),
      ),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: type)).then((result) {
          final snackBar = SnackBar(content: Text('Copied to Clipboard'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
        Navigator.pop(context);
      },
    );
  }

  Widget _footerBuilder({required Wall wall}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            iconSize: 18,
            onPressed: () {
              // not sure on current view or refresh
              context.read<PostBloc>().add(UpdatePostEvent(
                  post: wall.post!.copyWith(isLiked: !wall.post!.isLiked!)));
              context.read<WallBloc>().add(FetchWallEvent());
            },
            icon: wall.post!.isLiked!
                ? Icon(Icons.thumb_up_alt_rounded, color: Colors.blue)
                : Icon(Icons.thumb_up_alt_outlined, color: Colors.black54)),
        IconButton(
            iconSize: 18,
            onPressed: () {},
            icon: Icon(Icons.mode_comment_outlined, color: Colors.black54)),
        IconButton(
            iconSize: 18,
            onPressed: () {},
            icon: Icon(Icons.ios_share_rounded, color: Colors.black54)),
      ],
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

  Widget _addPostButton({required User user}) {
    return ElevatedButton(
      onPressed: () {
        Post addPost = Post(
          title: _titleController.text,
          body: _bodyController.text,
        );

        context
            .read<WallBloc>()
            .add(AddWallEvent(wall: Wall(post: addPost, user: user)));

        Navigator.pop(context);
        _titleController.clear();
        _bodyController.clear();
      },
      child: Text('Publish'),
    );
  }

  Widget _floatingButton() {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
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
                    _addPostButton(user: state.user!),
                  ],
                ),
              ),
            );
          },
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

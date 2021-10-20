import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tolo/model/post.dart';
import 'package:tolo/src/wall/post/post_bloc.dart';

class PostView extends StatefulWidget {
  Post post;
  PostView({Key? key, required this.post}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    widget.post;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return _postBuilder();
      },
    );
  }

  Widget _postBuilder() {
    return Card(
      child: CheckboxListTile(
        checkColor: Colors.black45,
        activeColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              widget.post.title,
              style: widget.post.read!
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black45)
                  : TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
              ),
              onPressed: () {},
            ),
          ],
        ),
        value: widget.post.read!,
        onChanged: (value) {
          setState(() => widget.post.read = value!);
          context.read<PostBloc>().add(UpdatePostEvent(post: widget.post));
        },
      ),
    );
  }
}

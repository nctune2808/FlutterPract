import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tolo/model/post.dart';
import 'package:tolo/src/timeline/post/post_bloc.dart';
import 'package:tolo/src/timeline/timeline_bloc.dart';
import 'package:tolo/utility/function/covert.dart';

class PostView extends StatefulWidget {
  Post post;
  PostView({Key? key, required this.post}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Post? _post;

  @override
  void initState() {
    _post = widget.post;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           readTime(post.created_at!),
    //           style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
    //         ),
    //         Text(post.title),
    //         Text(post.body),
    //       ],
    //     ),
    //   ),
    // );

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
              style: _post!.read
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
        value: _post!.read,
        onChanged: (value) {
          Post updatePost = widget.post.copyWith(read: value!);
          context.read<PostBloc>().add(UpdatePostEvent(post: updatePost));
          setState(() => _post = updatePost);
        },
      ),
    );
  }
}

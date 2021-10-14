import 'package:flutter/material.dart';

import 'package:shoping_list_bloc/model/post.dart';
import 'package:shoping_list_bloc/utility/function/covert.dart';

class PostView extends StatelessWidget {
  Post post;
  PostView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              readTime(post.created_at!),
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
            ),
            Text(post.title),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}

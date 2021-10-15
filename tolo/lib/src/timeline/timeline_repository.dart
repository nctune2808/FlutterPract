import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/service/graphql/graphql_service.dart';

class TimelineRepository {
  TimelineRepository._();
  static final TimelineRepository instance = TimelineRepository._();

  String FETCH_POSTS() {
    return """
      query{
        posts(order_by: {created_at: desc}) {
          id,
          title,
          body,
          created_at,
          read,
        }
      }
    """;
  }

  Future<List<Post>> getPosts() async {
    List<Post> postList = [];
    final QueryResult result = await GraphQlService.client.query(
      QueryOptions(
        document: gql(FETCH_POSTS()),
      ),
    );

    final posts = result.data?['posts'];

    if (posts.isNotEmpty) {
      for (var post in posts) {
        Post _post = Post.fromMap(post);
        postList.add(_post);
        // print(_post.toMap());
      }
      return postList;
    }
    return [];
  }
}

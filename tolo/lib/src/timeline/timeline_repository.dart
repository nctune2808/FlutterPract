import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/service/graphql/graphql_service.dart';

class TimelineRepository {
  TimelineRepository._();
  static final TimelineRepository instance = TimelineRepository._();

  String FRAGMENT_POST = '''
      fragment PostFragment on posts{
        id,
        title,
        body,
        read,
        created_at,
      }
    ''';

  String FETCH_POSTS() {
    return '''
      $FRAGMENT_POST
      query AllPost{
        posts(order_by: {created_at: desc}) {
          ...PostFragment
        }
      }
    ''';
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

  String STREAM_POSTS() {
    return '''
      subscription subPosts{
        posts(order_by: {created_at: desc}) {
          id,
          title,
          body,
          created_at,
          read,
        }
      }
    ''';
  }

  Stream<QueryResult> streamPosts() {
    Stream<QueryResult> subscription = GraphQlService.client.subscribe(
      SubscriptionOptions(
        document: gql(STREAM_POSTS()),
      ),
    );

    subscription.listen((result) {
      // print('New Review: ${result.data?['posts']}');
      (result.data?['posts'] as List)
          .map((post) => Post.fromMap(post))
          .toList();
    });

    return subscription;
  }
}

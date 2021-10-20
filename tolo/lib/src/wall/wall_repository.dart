import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/utility/fragment/post_fragments.dart';

class WallRepository {
  WallRepository._();
  static final WallRepository instance = WallRepository._();

  static const String FETCH_POSTS = '''
      ${PostFragment.POST_DATA}
      query AllPost{
        posts(order_by: {created_at: desc}) {
          ...PostData
        }
      }
    ''';

  Future<List<Post>> getPosts() async {
    // return QueryResult from Future<>
    final QueryResult result = await GraphQlService.performQuery(
      document: FETCH_POSTS,
    );
    final posts = result.data?['posts'];
    // Assign model
    if (posts.isNotEmpty) {
      return (posts as List).map((post) => Post.fromMap(post)).toList();
    }
    return [];
  }

  static const String STREAM_POSTS = '''
      ${PostFragment.POST_DATA}
      subscription subPosts{
        posts(order_by: {created_at: desc}) {
          ...PostData
        }
      }
    ''';

  Stream<QueryResult> streamPosts() {
    final Stream<QueryResult> subscription = GraphQlService.performSubscribe(
      document: STREAM_POSTS,
    );

    subscription.listen((result) {
      (result.data?['posts'] as List)
          .map((post) => Post.fromMap(post))
          .toList();
    });

    return subscription;
  }
}

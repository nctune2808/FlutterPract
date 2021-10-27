import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/model/wall.dart';
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/src/wall/post/post_repository.dart';
import 'package:tolo/utility/fragment/post_fragments.dart';
import 'package:tolo/utility/fragment/user_fragments.dart';

class WallRepository {
  WallRepository._();
  static final WallRepository instance = WallRepository._();

  //------------------------------NEW------------------------
  static const String FETCH_WALLS = '''
    ${PostFragment.POST_DATA}
    ${UserFragment.USER_DATA}
    query AllWalls{
      walls(order_by: {created_at: desc}) {
        id
        created_at
        post {
          ...PostData
        }
        user {
          ...UserData
        }
      }
    }
    ''';

  Future<List<Wall>> getWalls() async {
    List<Wall> listWall = [];
    // return QueryResult from Future<>
    final QueryResult result = await GraphQlService.performQuery(
      document: FETCH_WALLS,
    );
    final walls = result.data?['walls'];
    // Assign model
    if (walls.isNotEmpty) {
      listWall = (walls as List).map((wall) => Wall.fromMap(wall)).toList();
    }
    return listWall;
  }

  static const String INSERT_WALL = '''

    ${PostFragment.POST_DATA}
    ${UserFragment.USER_DATA}
    mutation insertWalls(\$data: walls_insert_input!) {
      insert_walls_one(object: \$data) {
        id
        created_at
        post {
          ...PostData
        }
        user {
          ...UserData
        }
      }
    }
  ''';

  Future addWall({required Wall wall}) async {
    print(wall);

    Post ins_post = await PostRepository.instance.insertPost(post: wall.post!);
    print(ins_post.id);

    try {
      final QueryResult result = await GraphQlService.performMutate(
        document: INSERT_WALL,
        variables: {
          "data": {
            "post_id": ins_post.id,
            "user_id": wall.user!.UUID,
          }
        },
      );
      final insertedWall = result.data?['insert_walls_one'];
      print(insertedWall);
      return Wall.fromMap(insertedWall);
    } catch (e) {
      throw e;
    }
  }

  //------------------------------OLD------------------------

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

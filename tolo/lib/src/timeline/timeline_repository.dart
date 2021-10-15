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

  String INSERT_POST() {
    return """
    mutation insertPosts(\$object: posts_insert_input!) {
      insert_posts_one(object: \$object) {
        title,
        body,
      }
    }
    """;
  }

  Future<void> insertPost({required Post post}) async {
    try {
      QueryResult result = await GraphQlService.client.mutate(
        MutationOptions(
            document: gql(INSERT_POST()), variables: {"object": post.toMap()}),
      );

      // print(result.data!.isNotEmpty);
    } catch (e) {
      throw e;
    }
  }

  String UPDATE_POST() {
    return """
      mutation updatePosts(\$id: Int! ,\$data: posts_set_input) {
        update_posts_by_pk(pk_columns: {id: \$id}, _set: \$data){
          id
        }
      }
    """;
  }

  Future<void> updatePost({required Post post}) async {
    try {
      QueryResult result = await GraphQlService.client.mutate(MutationOptions(
          document: gql(UPDATE_POST()),
          variables: {"id": post.id, "data": post.toMap()}));
      print(result.data);
    } catch (e) {
      throw e;
    }
  }

  String DELETE_POST() {
    return """
      mutation deletePosts(\$id: Int!) {
        delete_posts_by_pk(id: \$id){
          id
        }
      }
    """;
  }
}

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/service/graphql/graphql_service.dart';

class PostRepository {
  PostRepository._();
  static final PostRepository instance = PostRepository._();

  String FETCH_POST() {
    return '''
      query getPostById(\$id: Int!){
        posts_by_pk(id: \$id) {
          id,
          title,
          body,
          read,
          created_at, 
        }
      }
    ''';
  }

  String INSERT_POST() {
    return '''
    mutation insertPosts(\$data: posts_insert_input!) {
      insert_posts_one(object: \$data) {
        id,
        title,
        body,
        read,
        created_at
      }
    }
    ''';
  }

  Future<Post> insertPost({required Post post}) async {
    try {
      QueryResult result = await GraphQlService.client.mutate(
        MutationOptions(
            document: gql(INSERT_POST()), variables: {"data": post.toMap()}),
      );
      final insertedPost = result.data?['insert_posts_one'];
      print(insertedPost);
      return insertedPost;
    } catch (e) {
      throw e;
    }

    // GraphQlService.client.subscribe(options)
  }

  String UPDATE_POST() {
    return '''
      mutation updatePosts(\$id: Int! ,\$data: posts_set_input) {
        update_posts_by_pk(pk_columns: {id: \$id}, _set: \$data){
          id,
          title,
          body,
          read,
          created_at, 
        }
      }
    ''';
  }

  Future<Post> updatePost({required Post post}) async {
    try {
      QueryResult result = await GraphQlService.client.mutate(MutationOptions(
          document: gql(UPDATE_POST()),
          variables: {"id": post.id, "data": post.toMap()}));

      final updatedPost = result.data?['update_posts_by_pk'];
      print(updatedPost);
      return Post.fromMap(updatedPost);
    } catch (e) {
      throw e;
    }
  }

  String DELETE_POST() {
    return '''
      mutation deletePosts(\$id: Int!) {
        delete_posts_by_pk(id: \$id){
          id
        }
      }
    ''';
  }
}

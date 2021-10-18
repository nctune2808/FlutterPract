import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/service/graphql/graphql_service.dart';
import 'package:tolo/utility/fragment/post_fragments.dart';

class PostRepository {
  PostRepository._();
  static final PostRepository instance = PostRepository._();

  String FETCH_POST() {
    return '''
    ${PostFragment.POST_DATA}
      query getPostById(\$id: Int!){
        posts_by_pk(id: \$id) {
          ...PostData 
        }
      }
    ''';
  }

  String INSERT_POST() {
    return '''
      ${PostFragment.POST_DATA}
      mutation insertPosts(\$data: posts_insert_input!) {
        insert_posts_one(object: \$data) {
          ...PostData
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
      ${PostFragment.POST_DATA}
      mutation updatePosts(\$id: Int! ,\$data: posts_set_input) {
        update_posts_by_pk(pk_columns: {id: \$id}, _set: \$data){
          ...PostData
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
      ${PostFragment.POST_DATA}
      mutation deletePosts(\$id: Int!) {
        delete_posts_by_pk(id: \$id){
          ...PostData
        }
      }
    ''';
  }
}

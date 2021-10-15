import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/service/graphql_service.dart';

class TimelineRepository {
  TimelineRepository._();

  static final TimelineRepository instance = TimelineRepository._();

  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.networkOnly),
      mutate: Policies(fetch: FetchPolicy.networkOnly),
    ),
    cache: GraphQLCache(store: InMemoryStore()),
    link: GraphQlService.httpLink,
  );

  String FETCH_POSTS() {
    return """
      query{
        posts(order_by: {created_at: desc}) {
          id,
          title,
          body,
          created_at
        }
      }
    """;
  }

  Future<List<Post>> getPosts() async {
    List<Post> postList = [];
    final QueryResult result = await _client.query(
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
        body
      }
    }
    """;
  }

  Future<void> insertPost({required Post post}) async {
    try {
      QueryResult result = await _client.mutate(
        MutationOptions(
            document: gql(INSERT_POST()), variables: {"object": post.toMap()}),
      );

      // print(result.data!.isNotEmpty);
    } catch (e) {
      throw e;
    }
  }
}

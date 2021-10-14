import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoping_list_bloc/model/post.dart';
import 'package:shoping_list_bloc/service/graphql_service.dart';

class TimelineRepository {
  TimelineRepository._();

  static final TimelineRepository instance = TimelineRepository._();

  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.networkOnly),
    ),
    cache: GraphQLCache(store: InMemoryStore()),
    link: GraphQlService.httpLink,
  );

  String queryPosts() {
    return """
      query{
        posts(order_by: {created_at: asc}) {
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
        document: gql(queryPosts()),
      ),
    );

    final posts = result.data?['posts'];

    if (posts.isNotEmpty) {
      for (var post in posts) {
        Post _post = Post.fromMap(post);
        postList.add(_post);
        // print(_post.toMap());
      }
      print("fetched");
      return postList;
    }
    return [];
  }
}

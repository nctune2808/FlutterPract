import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  static ValueNotifier<GraphQLClient> clientValue =
      ValueNotifier<GraphQLClient>(_client);

  static GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.networkOnly),
      mutate: Policies(fetch: FetchPolicy.networkOnly),
      subscribe: Policies(fetch: FetchPolicy.networkOnly),
    ),
    cache: GraphQLCache(store: InMemoryStore()),
    link: webLink,
  );

  static WebSocketLink webLink = WebSocketLink(
    'ws://tolo.hasura.app/v1/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      initialPayload: () => {
        'headers': {
          'content-type': 'application/json',
          'x-hasura-admin-secret':
              'VtgetVrtGuNnnZVvruqBNHdEYq1z5I5RMuL2cl9h7RNUQnL0NIvvSdQQPxxGl6Xs',
        }
      },
    ),
  );

  // QUERY
  static Future<QueryResult> performQuery({
    required String document,
    Map<String, dynamic>? variables,
  }) async {
    QueryOptions options;
    if (variables == null) {
      options = QueryOptions(document: gql(document));
    } else {
      options = QueryOptions(document: gql(document), variables: variables);
    }

    final result = await _client.query(options);
    return result;
  }

  // MUTATION
  static Future<QueryResult> performMutate({
    required String document,
    required Map<String, dynamic> variables,
  }) async {
    MutationOptions options = MutationOptions(
      document: gql(document),
      variables: variables,
    );

    final result = await _client.mutate(options);
    return result;
  }

  // SUBSCRIPTION
  static Stream<QueryResult> performSubscribe({
    required String document,
  }) {
    SubscriptionOptions options = SubscriptionOptions(document: gql(document));
    final subscription = _client.subscribe(options);
    return subscription;
  }
}

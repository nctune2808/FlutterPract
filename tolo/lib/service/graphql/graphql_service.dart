import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  // static HttpLink httpLink = HttpLink(
  //   'https://tolo.hasura.app/v1/graphql',
  //   defaultHeaders: {
  //     'content-type': 'application/json',
  //     'x-hasura-admin-secret':
  //         'VtgetVrtGuNnnZVvruqBNHdEYq1z5I5RMuL2cl9h7RNUQnL0NIvvSdQQPxxGl6Xs',
  //   },
  // );

  static ValueNotifier<GraphQLClient> clientValue =
      ValueNotifier<GraphQLClient>(client);

  static GraphQLClient client = GraphQLClient(
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
}

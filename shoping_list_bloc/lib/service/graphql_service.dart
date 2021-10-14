import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  static HttpLink httpLink = HttpLink(
    'https://tolo.hasura.app/v1/graphql',
    defaultHeaders: {
      'content-type': 'application/json',
      'x-hasura-admin-secret':
          'VtgetVrtGuNnnZVvruqBNHdEYq1z5I5RMuL2cl9h7RNUQnL0NIvvSdQQPxxGl6Xs',
    },
  );
  static ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(link: httpLink, cache: GraphQLCache(store: InMemoryStore())),
  );
}

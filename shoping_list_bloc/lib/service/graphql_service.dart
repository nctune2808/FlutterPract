// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class GraphQlService {
//   static HttpLink httpLink = HttpLink(
//     uri: 'https://tolo.hasura.app/v1/graphql',
//   );

//   static AuthLink authLink = AuthLink(getToken: () {  });
//   static Link link = httpLink as Link;
//   ValueNotifier<GraphQLClient> client = ValueNotifier(
//     GraphQLClient(
//       cache: InMemoryCache(),
//       link: link,
//     ),
//   );
// }

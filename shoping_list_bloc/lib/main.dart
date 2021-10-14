import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoping_list_bloc/route/router.dart';
import 'package:shoping_list_bloc/service/graphql_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var appWrapper = GraphQLProvider(
    client: GraphQlService.client,
    child: MyApp(router: AppRouter()),
  );

  runApp(appWrapper);
}

class MyApp extends StatelessWidget {
  final AppRouter? router;
  const MyApp({
    Key? key,
    this.router,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router!.generateRoute,
      initialRoute: "/",
    );
  }
}

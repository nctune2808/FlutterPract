import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/route/router.dart';
import 'package:tolo/service/graphql/graphql_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  var appWrapper = GraphQLProvider(
    client: GraphQlService.clientValue,
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
      title: "ToloApp",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router!.generateRoute,
      initialRoute: "/",
    );
  }
}

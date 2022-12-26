import 'package:cthtc/routes/router.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:cthtc/global/services/graphql.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  // WidgetsFlutterBinding.ensureInitialized();
  var appWrapper = GraphQLProvider(
    client: GraphQlService.clientValue,
    child: MyApp(routers: AppRouter()),
  );
  runApp(appWrapper);
}

class MyApp extends StatefulWidget {
  final AppRouter? routers;
  const MyApp({super.key, this.routers});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final navKey = new GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CTHTC',
      theme: MyTheme.defaultTheme,
      onGenerateRoute: widget.routers!.generateRoute,
      initialRoute: HOME_PAGE,
      navigatorKey: navKey,
    );
  }
}

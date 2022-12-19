import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cthtc/pages/home/carousels/simple.dart';
import 'package:cthtc/routes/router.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'amplifyconfiguration.dart';

void main() {
  setPathUrlStrategy();
  // setHashUrlStrategy();
  runApp(MyApp(
    routers: AppRouter(),
  ));
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
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      print('Could not configure Amplify: $e');
    }
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

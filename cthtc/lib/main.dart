import 'package:carousel_slider/carousel_slider.dart';
import 'package:cthtc/pages/home/carousels/simple.dart';
import 'package:cthtc/routes/router.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  // setHashUrlStrategy();
  runApp(MyApp(
    routers: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter? routers;
  const MyApp({super.key, this.routers});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final navKey = new GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CTHTC',
      theme: MyTheme.defaultTheme,
      onGenerateRoute: routers!.generateRoute,
      initialRoute: HOME_PAGE,
      navigatorKey: navKey,
    );
  }
}

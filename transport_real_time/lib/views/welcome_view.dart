import 'package:flutter/material.dart';
import 'package:transport_real_time/views/map/map_view.dart';
import 'package:transport_real_time/views/search/search_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Let's Go")),
      body: Column(
        children: [
          SearchView(),
          MapView(),
        ],
      ),
    );
  }
}

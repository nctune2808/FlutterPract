import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:cthtc/pages/navigation/menu_bar.dart';
import 'package:cthtc/routes/router.dart';
import 'package:cthtc/searchable/simple.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../carousels/simple.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: MenuBar(
            path: HOME_PAGE,
          ),
        ),
        body: _centreBuilder());
  }

  Widget _centreBuilder() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [SimpleCarousel(), SimpleSearch()],
      ),
    );
  }
}

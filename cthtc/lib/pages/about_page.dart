import 'package:cthtc/extension/responsive.dart';
import 'package:cthtc/pages/navigation/top_menu.dart';
import 'package:cthtc/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'navigation/side_menu.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: context.responsive(
          df: AppBar(centerTitle: true, title: Text('CTHTC')),
          md: AppBar(
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
              flexibleSpace: TopMenuBar()),
        ),
        body: _centreBuilder());
  }

  Widget _centreBuilder() {
    return Container(
      child: Text('ABOUT'),
    );
  }
}

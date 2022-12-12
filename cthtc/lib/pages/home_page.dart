import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:cthtc/searchable/simple.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(appBar: _topBuilder(), body: _centreBuilder());
  }

  AppBar _topBuilder() {
    return AdaptiveNavBar(
      screenWidth: MediaQuery.of(context).size.width,
      toolbarHeight: MediaQuery.of(context).size.height / 12,
      title: const Text('CTHTC'),
      centerTitle: false,
      titleSpacing: 30,
      onTitleTapped: () {},
      navBarItems: [
        NavBarItem(
          text: 'Home',
          onTap: () {},
        ),
        NavBarItem(
          text: 'Project',
          onTap: () {},
        ),
        NavBarItem(
          text: 'About',
          onTap: () {},
        ),
        NavBarItem(
          text: 'Contact',
          onTap: () {},
        )
      ],
    );
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

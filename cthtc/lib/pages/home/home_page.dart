import 'package:cthtc/pages/home/carousels/simple.dart';
import 'package:cthtc/extension/responsive.dart';
import 'package:cthtc/pages/home/previews/simple.dart';
import 'package:cthtc/pages/navigation/side_menu.dart';
import 'package:cthtc/pages/navigation/top_menu.dart';
import 'package:cthtc/pages/home/searchable/simple.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleCarousel(),
          SimpleSearch(),
          SimplePreview(),
        ],
      ),
    );
  }
}

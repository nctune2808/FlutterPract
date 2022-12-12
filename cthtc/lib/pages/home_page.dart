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
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          titleSpacing:50,
          actions: [
            Container(width: 100, child: ListTile(visualDensity: VisualDensity.standard,title: Text('Menu 1'), onTap: () {},)),
            Container(width: 100, child: ListTile(visualDensity: VisualDensity.standard,title: Text('Menu 2'), onTap: () {},)),
            Container(width: 100, child: ListTile(visualDensity: VisualDensity.standard,title: Text('Menu 3'), onTap: () {},)),
            Container(width: 100, child: ListTile(visualDensity: VisualDensity.standard,title: Text('Menu 4'), onTap: () {},)),
            
          ],
          // actions: [Center(child: Text('Menu1')),Center(child: Text('Menu2')),Center(child: Text('Menu3'))],
        ),
        body: SimpleCarousel());
  }
}
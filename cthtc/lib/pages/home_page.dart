import 'package:adaptive_navbar/adaptive_navbar.dart';
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
    

    return Scaffold(appBar: _topBuilder(), body: _centreBuilder());
  }

  AppBar _topBuilder() {
    GlobalKey _key = GlobalKey();
    return AdaptiveNavBar(
      canTitleGetTapped:true,
      screenWidth: MediaQuery.of(context).size.width,
      toolbarHeight: MediaQuery.of(context).size.height / 12,
      elevation: 5,
      title: const Text('CTHTC'),
      centerTitle: false,
      titleSpacing: 25,
      onTitleTapped: () {},
      navBarItems: [
        NavBarItem(
          text: 'Home',
          onTap: () {},
        ),
        NavBarItem(
          text: 'About',
          onTap: () {},
        ),
        NavBarItem(
          text: 'Contact',
          onTap: () {},
        ),
        NavBarItem(
          text: 'Project',
          onTap: () {

            
            List<PopupMenuEntry> items = [
            PopupMenuItem(
              child: PopupMenuButton(
                elevation: 2,
                padding: EdgeInsets.zero,
                offset: Offset( - MediaQuery.of(context).size.width / 5 + 10, -8),
                // position: PopupMenuPosition.under,
                child: ListTile(title: Text('AAA'),),
                itemBuilder: (context) {
                  return <PopupMenuEntry> [
                    PopupMenuItem(child: Text('1'),),
                    PopupMenuItem(child: Text('2'),),
                    PopupMenuItem(child: Text('3'),),
                  ];
                },),
            ),
            PopupMenuItem(
              child: ListTile(title: Text('BBB'),),
            ),
            PopupMenuItem(
              child: ListTile(title: Text('CCC'),),
            ),
            ];
            RelativeRect position = RelativeRect.fromLTRB(1, MediaQuery.of(context).size.height / 12, 0, 0);
            showMenu(
              elevation: 4,
              // useRootNavigator: true,
              context: context, 
              position: position, 
              items: items,
              // color: DarkenColour
              constraints: BoxConstraints.tightFor(width: MediaQuery.of(context).size.width / 5)
            );
          }
        ),
        
        
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

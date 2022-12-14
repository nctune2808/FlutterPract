import 'package:cthtc/routes/router.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:cthtc/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopMenuBar extends StatefulWidget {
  TopMenuBar({super.key});

  @override
  State<TopMenuBar> createState() => _TopMenuBarState();
}

class _TopMenuBarState extends State<TopMenuBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuBarItem(title: 'CTHTC', route: HOME_PAGE),
          Row(
            children: [
              MenuBarItem(title: 'Home', route: HOME_PAGE),
              MenuBarItem(title: 'About', route: ABOUT_PAGE),
              MenuBarItem(title: 'Contact', route: CONTACT_PAGE),
              MenuBarItem(title: 'Project', route: '')
            ]
          )
        ],
      ),
    );
  }
}
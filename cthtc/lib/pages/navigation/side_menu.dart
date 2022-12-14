import 'package:cthtc/routes/router.dart';
import 'package:cthtc/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(
      children: [
        MenuBarItem(title: 'Home', route: HOME_PAGE),
        MenuBarItem(title: 'About', route: ABOUT_PAGE),
        MenuBarItem(title: 'contact', route: CONTACT_PAGE),
        MenuBarItem(title: 'Project', route: '')
      ],));
  }
}
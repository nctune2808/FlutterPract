import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:cthtc/extension/neumorphism.dart';
import 'package:cthtc/extension/responsive.dart';
import 'package:flutter/material.dart';

import 'package:cthtc/routes/router.dart';

class MenuBar extends StatelessWidget {
  String path;
  MenuBar({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavBar(
      automaticallyImplyLeading: false,
      canTitleGetTapped: true,
      screenWidth: MediaQuery.of(context).size.width,
      elevation: 5,
      title: const Text('CTHTC'),
      centerTitle: false,
      titleSpacing: 25,
      onTitleTapped: () {
        Navigator.of(context).popAndPushNamed(HOME_PAGE);
      },
      navBarItems: [
        NavBarItem(
          text: 'Home',
          // hoverColor: path == HOME_PAGE ? Colors.red : null,
          onTap: () {
            Navigator.popAndPushNamed(context, HOME_PAGE);
          },
        ),
        NavBarItem(
          text: 'About',
          autofocus: path == ABOUT_PAGE,
          onTap: () {
            // Navigator.pop(context);
            Navigator.of(context).popAndPushNamed(ABOUT_PAGE);
          },
        ),
        NavBarItem(
          text: 'Contact',
          onTap: () {},
        ),
        NavBarItem(
            text: 'Project',
            onTap: () {
              Navigator.of(context).popAndPushNamed(HOME_PAGE);
              List<PopupMenuEntry> items = [
                PopupMenuItem(
                  child: PopupMenuButton(
                    elevation: 1,
                    padding: EdgeInsets.zero,
                    offset:
                        Offset(-MediaQuery.of(context).size.width / 5 + 10, -8),
                    // position: PopupMenuPosition.under,
                    child: ListTile(
                      title: Text('AAA'),
                    ),
                    itemBuilder: (context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Text('1'),
                        ),
                        PopupMenuItem(
                          child: Text('2'),
                        ),
                        PopupMenuItem(
                          child: Text('3'),
                        ),
                      ];
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('BBB'),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('CCC'),
                  ),
                ),
              ];
              RelativeRect position = RelativeRect.fromLTRB(1, 60, 0, 0);
              showMenu(
                elevation: 3,
                useRootNavigator: true,
                context: context,
                position: position,
                items: items,
                // color: DarkenColour
                constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width / 5),
              );
            }),
      ],
    );
  }
}

import 'package:cthtc/extension/neumorphism.dart';
import 'package:cthtc/extension/responsive.dart';
import 'package:cthtc/themes/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuBarItem extends StatelessWidget {
  late String title;
  late String route;
  MenuBarItem({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(title),
        ),
        onTap: (() {
          List<PopupMenuEntry> items = [
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
          
          RelativeRect posDrawer = RelativeRect.fromLTRB(150, 180, 200, 0);
          RelativeRect posNavBar = RelativeRect.fromLTRB(1, 65, 0, 0);

          ShapeBorder shapeDrawer = RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          );

          ShapeBorder shapeNavBar = RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          );

          route.isNotEmpty
              ? Navigator.of(context).popAndPushNamed(route)
              : showMenu(
                  context: context,
                  position: context.responsive(df: posDrawer, md: posNavBar),
                  items: items,
                  elevation: 3,
                  shape: context.responsive(df: shapeDrawer, md: shapeNavBar),
                  // color: PrimaryColor
                  );
        }));
  }
}

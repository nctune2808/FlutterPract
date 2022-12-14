import 'package:cthtc/extension/neumorphism.dart';
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
          // color: isSelected ? Colors.amber : null,
          padding: EdgeInsets.all(20),
          // color: Colors.red,
          child: Text(title),
        ),
        
        onTap:(() {

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
          RelativeRect position = RelativeRect.fromLTRB(1, 65, 0, 0);

          route.isNotEmpty 
          ? Navigator.of(context).popAndPushNamed(route)
          : showMenu(context: context, position: position, items: items) 
          ;
        })
      );
  }
}
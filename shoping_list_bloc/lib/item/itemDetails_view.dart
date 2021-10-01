import 'package:flutter/material.dart';

import '../../model/item.dart';

class ItemDetailsView extends StatelessWidget {
  final Item item;

  const ItemDetailsView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.title),
          actions: [
            IconButton(
              icon: Icon(Icons.check, size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Center(child: Text(item.note)));
  }
}

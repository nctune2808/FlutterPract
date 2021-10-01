import 'package:flutter/material.dart';

import 'model/item.dart';

class ItemDetailsView extends StatelessWidget {
  static const valueKey = ValueKey('ItemDetailsView');
  final Item item;

  const ItemDetailsView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(item.title)),
        body: Center(child: Text(item.note)));
  }
}

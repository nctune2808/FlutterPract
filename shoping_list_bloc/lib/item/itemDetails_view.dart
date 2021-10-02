import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/cart/cart_bloc.dart';

import '../../model/item.dart';

class ItemDetailsView extends StatelessWidget {
  final Item item;

  const ItemDetailsView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(item.title), actions: [
        IconButton(
          icon: Icon(Icons.check, size: 30),
          onPressed: () {
            BlocProvider.of<CartBloc>(context)
              ..add(SaveItemEvent(item: item, note: _noteController.text));
            Navigator.of(context).pop();
          },
        )
      ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Note'),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: item.note),
                controller: _noteController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

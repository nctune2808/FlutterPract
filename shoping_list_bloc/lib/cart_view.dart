import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/detail_view.dart';
import 'package:shoping_list_bloc/model/item.dart';

import 'bloc/cart_bloc.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _cartForm());
  }

  Widget _cartForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Add something new?'),
              controller: _titleController,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CartBloc>(context)
                    ..add(AddItemEvent(
                      item: Item(
                        title: _titleController.text,
                        note: 'note',
                      ),
                    ));
                  _titleController.text = '';
                },
                child: Text('Add Item')),
            DetailView()
          ],
        ),
      ),
    );
  }
}

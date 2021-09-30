import 'dart:ui';

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
  final _noteController = TextEditingController();

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
          children: [_groupTextField(), _addItemButton(), _previewList()],
        ),
      ),
    );
  }

  Widget _groupTextField() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: 'Add something new?'),
          controller: _titleController,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Some note?'),
          controller: _noteController,
        ),
      ],
    );
  }

  Widget _addItemButton() {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<CartBloc>(context)
          ..add(AddItemEvent(
            item: Item(
              title: _titleController.text,
              note: _noteController.text,
              isDone: false,
            ),
          ));
        _titleController.text = '';
        _noteController.text = '';
      },
      child: Text('Add Item'),
    );
  }

  Widget _previewList() {
    return SizedBox(
      height: 500,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is ListCartInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListCartSuccess) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: ListTile(
                      title: Text(
                        state.items[index].title,
                        style: state.items[index].isDone
                            ? TextStyle(decoration: TextDecoration.lineThrough)
                            : null,
                      ),
                      // subtitle: Text(state.items[index].note),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context)
                            ..add(DeleteItemEvent(
                              item: state.items[index],
                            ));
                        },
                      ),
                      onTap: () {
                        print(state.items[index].title);
                      },
                    ),
                    value: state.items[index].isDone,
                    onChanged: (value) {
                      print("checkbox click ${state.items[index].title}");

                      BlocProvider.of<CartBloc>(context)
                        ..add(UpdateItemEvent(
                          item: state.items[index],
                          isDone: value as bool,
                        ));

                      print("value: ${value}");
                    },
                  ),
                );
              },
            );
          } else if (state is ListCartFailure) {
            return Center(
              child: Text('Error: ${state.exception}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/itemList_view.dart';
import 'package:shoping_list_bloc/loading_view.dart';
import 'package:shoping_list_bloc/model/item.dart';

import 'bloc/cart_bloc.dart';
import 'itemDetails_view.dart';

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
    return Scaffold(
      appBar: _navBar(),
      // Daclare state for all CART ITEMS here
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is ListCartSuccess) {
            // pass state
            return state.items.isEmpty ? _emptyForm() : _cartForm(state.items);
          } else if (state is ListCartFailure) {
            return Center(child: Text('Error: ${state.exception}'));
          } else {
            return LoadingView();
          }
        },
      ),
      floatingActionButton: _floatingButton(),
    );
  }

  AppBar _navBar() {
    return AppBar(
      title: Text('Shopping List'),
      leading: IconButton(icon: Icon(Icons.menu, size: 30), onPressed: () {}),
      actions: [
        IconButton(icon: Icon(Icons.logout, size: 30), onPressed: () {}),
      ],
    );
  }

  Widget _emptyForm() {
    return Center(
      child: Text(
        'Empty Cart\nTap button to create new',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _cartForm(List<Item> items) {
    return Form(
      key: _formKey,
      child: IemListView(
        items: items,
      ),
      // child: LoadingView(),
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
        Navigator.of(context).pop();
        _titleController.text = '';
        _noteController.text = '';
      },
      child: Text('Add Item'),
    );
  }

  Widget _floatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                _groupTextField(),
                _addItemButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

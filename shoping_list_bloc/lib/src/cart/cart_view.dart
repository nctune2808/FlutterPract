import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/model/cart.dart';
import 'package:shoping_list_bloc/model/item.dart';
import 'package:shoping_list_bloc/src/cart/cartList_view.dart';
import 'package:shoping_list_bloc/src/cart/cart_bloc.dart';
import 'package:shoping_list_bloc/src/cart/cart_repository.dart';
import 'package:shoping_list_bloc/src/cart/item/item_view.dart';
import 'package:shoping_list_bloc/src/home/loading_view.dart';
import 'package:shoping_list_bloc/utility/state/form_submission_status.dart';

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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final formStatus = state.formStatus;
          if (state is RefreshableCart || formStatus is SubmissionSucess) {
            // return state.carts.isEmpty ? _emptyForm() : _cartForm(state.carts);
            return _sceneBuilder();
          } else if (formStatus is SubmissionFailed) {
            return Center(
                child: Text('Error: ${formStatus.exception.toString()}'));
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

  Widget _sceneBuilder() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: CartRepository().getSnapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return _emptyForm();
              }
              final carts = snapshot.data!.docs;

              return Expanded(
                child: ListView.builder(
                  // reverse: true,
                  itemCount: carts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemView(cart: carts[index]);
                  },
                ),
              );
            },
          ),
        ],
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

  Widget _addCartButton() {
    return ElevatedButton(
      onPressed: () {
        context.read<CartBloc>().add(AddCartEvent(
              cart: Cart(
                title: _titleController.text,
                note: _noteController.text,
                isDone: false,
              ),
            ));
        Navigator.of(context).pop();
        _titleController.clear();
        _noteController.clear();
      },
      child: Text('Add Cart'),
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
                _addCartButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

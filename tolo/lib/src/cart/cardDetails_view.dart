import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/model/cart.dart';
import 'package:tolo/src/cart/cart_bloc.dart';

class CartDetailsView extends StatelessWidget {
  final Cart cart;

  const CartDetailsView({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(cart.title), actions: [
        IconButton(
          icon: Icon(Icons.check, size: 30),
          onPressed: () {
            BlocProvider.of<CartBloc>(context)
              ..add(SaveCartEvent(cart: cart, note: _noteController.text));
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
                decoration: InputDecoration(hintText: cart.note),
                controller: _noteController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

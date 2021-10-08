import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/model/cart.dart';
import 'package:shoping_list_bloc/src/cart/cart_bloc.dart';

class ItemView extends StatefulWidget {
  Cart cart;
  ItemView({required this.cart});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  // @override
  // void dispose() {
  //   BlocProvider.of<CartBloc>(context).dispose();
  //   super.dispose();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    Cart deleteCart;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent,
          alignment: Alignment.centerRight,
          child: Text(
            'DELETE',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        direction: widget.cart.isDone
            ? DismissDirection.endToStart
            : DismissDirection.none,
        onDismissed: (direction) {
          deleteCart = widget.cart;

          context.read<CartBloc>().add(DeleteCartEvent(cart: widget.cart));

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(
                'Cart \'${widget.cart.title.toUpperCase()}\' is Deleted',
                textAlign: TextAlign.start,
              ),
              action: SnackBarAction(
                  label: "UNDO",
                  onPressed: () {
                    print("test: ${deleteCart.id}");
                    // context
                    //     .read<CartBloc>()
                    //     .add(AddCartEvent(cart: deleteCart));
                  }),
            ));
        },
        child: _buildItem(context),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        checkColor: Colors.black45,
        activeColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              widget.cart.title,
              style: widget.cart.isDone
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black45)
                  : TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: widget.cart.isDone ? Colors.black45 : Colors.blue,
              ),
              onPressed: () {
                // if (!cart['isDone'])
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => BlocProvider.value(
                //         value: BlocProvider.of<CartBloc>(context),
                //         child: CartDetailsView(cart: cart))));
              },
            ),
          ],
        ),
        value: widget.cart.isDone,
        onChanged: (value) {
          Cart updateCart = widget.cart.copyWith(isDone: value!);
          context.read<CartBloc>().add(UpdateCartEvent(cart: updateCart));
        },
      ),
    );
  }
}

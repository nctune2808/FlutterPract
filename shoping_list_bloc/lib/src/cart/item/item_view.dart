import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/src/cart/cart_bloc.dart';

class ItemView extends StatelessWidget {
  QueryDocumentSnapshot cart;
  ItemView({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        direction: cart['isDone']
            ? DismissDirection.endToStart
            : DismissDirection.none,
        onDismissed: (direction) {
          print(cart.id);
          // BlocProvider.of<CartBloc>(context)..add(event)
          context.read<CartBloc>().add(DeleteCartEvent(cartId: cart.id));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Cart \'${cart['title'].toUpperCase()}\' is Deleted',
              textAlign: TextAlign.start,
            ),
            action: SnackBarAction(
                label: "UNDO",
                onPressed: () {
                  // context.read<CartBloc>().add(InsertCartEvent(
                  //     index: index, deletedCart: deteledCart));
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
              cart['title'],
              style: cart['isDone']
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
                color: cart['isDone'] ? Colors.black45 : Colors.blue,
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
        value: cart['isDone'],
        onChanged: (value) {
          // context
          //     .read<CartBloc>()
          //     .add(UpdateCartEvent(cart: cart, isDone: value!));
        },
      ),
    );
  }
}

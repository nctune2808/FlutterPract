// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shoping_list_bloc/model/cart.dart';
// import 'package:shoping_list_bloc/src/cart/cardDetails_view.dart';
// import 'package:shoping_list_bloc/src/cart/cart_bloc.dart';

// class CartListView extends StatelessWidget {
//   final List<Cart> carts;

//   CartListView({
//     Key? key,
//     required this.carts,
//   }) : super(key: key);

//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: ListView.builder(
//         itemCount: carts.length,
//         itemBuilder: (context, index) {
//           Cart deteledCart = carts[index];
//           return Dismissible(
//             key: UniqueKey(),
//             background: Container(
//               color: Colors.redAccent,
//               alignment: Alignment.centerRight,
//               child: Text(
//                 'DELETE',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             direction: carts[index].isDone
//                 ? DismissDirection.endToStart
//                 : DismissDirection.none,
//             onDismissed: (direction) {
//               context.read<CartBloc>().add(DeleteCartEvent(cart: carts[index]));
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text(
//                   'Cart \'${carts[index].title.toUpperCase()}\' is Deleted',
//                   textAlign: TextAlign.start,
//                 ),
//                 action: SnackBarAction(
//                     label: "UNDO",
//                     onPressed: () {
//                       context.read<CartBloc>().add(InsertCartEvent(
//                           index: index, deletedCart: deteledCart));
//                     }),
//               ));
//             },
//             child: _listCart(context, carts[index]),
//           );
//         },
//       ),
//     );
//   }

//   Widget _listCart(BuildContext context, Cart cart) {
//     return Card(
//       child: CheckboxListTile(
//         checkColor: Colors.black45,
//         activeColor: Colors.white,
//         controlAffinity: ListTileControlAffinity.leading,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(),
//             Text(
//               cart.title,
//               style: cart.isDone
//                   ? TextStyle(
//                       decoration: TextDecoration.lineThrough,
//                       color: Colors.black45)
//                   : TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.edit,
//                 color: cart.isDone ? Colors.black45 : Colors.blue,
//               ),
//               onPressed: () {
//                 if (!cart.isDone)
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (_) => BlocProvider.value(
//                           value: BlocProvider.of<CartBloc>(context),
//                           child: CartDetailsView(cart: cart))));
//               },
//             ),
//           ],
//         ),
//         value: cart.isDone,
//         onChanged: (value) {
//           context
//               .read<CartBloc>()
//               .add(UpdateCartEvent(cart: cart, isDone: value!));
//         },
//       ),
//     );
//   }
// }

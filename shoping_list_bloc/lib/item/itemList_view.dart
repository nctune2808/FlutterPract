import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/cart/cart_bloc.dart';
import 'package:shoping_list_bloc/model/item.dart';
import 'package:shoping_list_bloc/route/router.dart';

import 'itemDetails_view.dart';

class IemListView extends StatelessWidget {
  final List<Item> items;

  IemListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          Item deteledItem = items[index];
          return Dismissible(
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
            direction: items[index].isDone
                ? DismissDirection.endToStart
                : DismissDirection.none,
            onDismissed: (direction) {
              BlocProvider.of<CartBloc>(context)
                ..add(DeleteItemEvent(item: items[index]));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  '${items[index].title.toUpperCase()} Deleted',
                  textAlign: TextAlign.center,
                ),
                action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                        ..add(InsertItemEvent(
                            index: index, deletedItem: deteledItem));
                    }),
              ));
            },
            child: _listCart(context, items[index]),
          );
        },
      ),
    );
  }

  Widget _listCart(BuildContext context, Item item) {
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
              item.title,
              style: item.isDone
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
                color: item.isDone ? Colors.black45 : Colors.blue,
              ),
              onPressed: () {
                !item.isDone
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<CartBloc>(context),
                            child: ItemDetailsView(item: item))))
                    : null;
              },
            ),
          ],
        ),
        value: item.isDone,
        onChanged: (value) {
          BlocProvider.of<CartBloc>(context)
            ..add(UpdateItemEvent(
              item: item,
              isDone: value!,
            ));
        },
      ),
    );
  }
}

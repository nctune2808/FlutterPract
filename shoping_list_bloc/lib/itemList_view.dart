import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/itemDetails_view.dart';

import 'bloc/cart_bloc.dart';
import 'model/item.dart';

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
          return Card(
            child: CheckboxListTile(
              checkColor: Colors.black45,
              activeColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              title: ListTile(
                title: Center(
                  child: Text(
                    items[index].title,
                    style: items[index].isDone
                        ? TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black45)
                        : TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                  ),
                ),
                // subtitle: Text(items[index].note),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: items[index].isDone ? Colors.black45 : Colors.blue,
                  ),
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context)
                      ..add(DeleteItemEvent(
                        item: items[index],
                      ));
                  },
                ),
                onTap: () {
                  print(items[index].title);
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Center(child: Text(items[index].title)),
                  //       content: Text(items[index].note),
                  //     );
                  //   },
                  // );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ItemDetailsView(
                        item: items[index],
                      ),
                    ),
                  );
                },
              ),
              value: items[index].isDone,
              onChanged: (value) {
                BlocProvider.of<CartBloc>(context)
                  ..add(UpdateItemEvent(
                    item: items[index],
                    isDone: value!,
                  ));
              },
            ),
          );
        },
      ),
    );
  }

  // Widget _newPage() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) {
  //       return Scaffold(
  //         appBar: AppBar(
  //             title: Text(
  //           items[index].title,
  //         )),
  //         body: Center(
  //           child: Text(items[index].note),
  //         ),
  //       );
  //     }),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'model/item.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Widget build(BuildContext context) {
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
                  child: ListTile(
                    title: Text(state.items[index].title),
                    leading: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                          ..add(DeleteItemEvent(
                            item: state.items[index],
                          ));
                      },
                    ),
                    subtitle: Text(state.items[index].note),
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

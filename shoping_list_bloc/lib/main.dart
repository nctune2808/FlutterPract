import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'cart_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CartBloc()..add(LoadingItemEvent()),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is ListCartInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListCartSuccess) {
              return CartView();
              // return Text("Work?");
            } else if (state is ListCartFailure) {
              return Center(
                child: Text('Error: ${state.exception}'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

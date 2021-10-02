import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/cart/cart_bloc.dart';
import 'package:shoping_list_bloc/cart/cart_view.dart';
import 'package:shoping_list_bloc/home/home_view.dart';
import 'package:shoping_list_bloc/home/loading_view.dart';

const HOME_ROUTE = "/";
const CART_ROUTE = "/cart";
const POST_ROUTE = "/post";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => HomeView());
      case CART_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CartBloc()..add(LoadingItemEvent()),
            child: CartView(),
          ),
        );
      case POST_ROUTE:
        return MaterialPageRoute(builder: (_) => LoadingView());
      default:
        return null;
    }
  }
}

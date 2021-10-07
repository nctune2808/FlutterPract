import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/cart/cart_bloc.dart';
import 'package:shoping_list_bloc/cart/cart_view.dart';
import 'package:shoping_list_bloc/home/home_view.dart';
import 'package:shoping_list_bloc/home/loading_view.dart';
import 'package:shoping_list_bloc/home/welcome_view.dart';
import 'package:shoping_list_bloc/signin/signin_bloc.dart';
import 'package:shoping_list_bloc/signin/signin_view.dart';
import 'package:shoping_list_bloc/signup/signup_bloc.dart';
import 'package:shoping_list_bloc/signup/signup_view.dart';
import 'package:shoping_list_bloc/talk/talk_bloc.dart';
import 'package:shoping_list_bloc/talk/talk_view.dart';

const WELCOME_ROUTE = "/";
const SIGNIN_ROUTE = "/signin";
const SIGNUP_ROUTE = "/signup";
const HOME_ROUTE = "/home";
const CART_ROUTE = "/cart";
const POST_ROUTE = "/post";
const TALK_ROUTE = "/talk";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WELCOME_ROUTE:
        return MaterialPageRoute(builder: (_) => WelcomeView());
      case SIGNIN_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SigninBloc(), child: SignInView()));
      case SIGNUP_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SignupBloc(), child: SignUpView()));
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => HomeView());
      case CART_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => CartBloc()..add(LoadingItemEvent()),
                child: CartView()));
      case POST_ROUTE:
        return MaterialPageRoute(builder: (_) => LoadingView());
      case TALK_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => TalkBloc()..add(LoadingMessageEvent()),
                child: TalkView()));
      default:
        return null;
    }
  }
}
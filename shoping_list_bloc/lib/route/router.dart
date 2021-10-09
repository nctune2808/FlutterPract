import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/auth/signin/signin_bloc.dart';
import 'package:shoping_list_bloc/auth/signin/signin_view.dart';
import 'package:shoping_list_bloc/auth/signup/signup_bloc.dart';
import 'package:shoping_list_bloc/auth/signup/signup_view.dart';
import 'package:shoping_list_bloc/src/cart/cart_bloc.dart';
import 'package:shoping_list_bloc/src/cart/cart_view.dart';
import 'package:shoping_list_bloc/src/gallery/gallery_view.dart';
import 'package:shoping_list_bloc/src/home/home_view.dart';
import 'package:shoping_list_bloc/src/home/loading_view.dart';
import 'package:shoping_list_bloc/src/home/welcome_view.dart';
import 'package:shoping_list_bloc/src/talk/talk_bloc.dart';
import 'package:shoping_list_bloc/src/talk/talk_view.dart';

const WELCOME_ROUTE = "/";
const SIGNIN_ROUTE = "/signin";
const SIGNUP_ROUTE = "/signup";
const HOME_ROUTE = "/home";
const CART_ROUTE = "/cart";
const POST_ROUTE = "/post";
const TALK_ROUTE = "/talk";
const GALLERY_ROUTE = "/galerry";

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
                create: (context) => CartBloc()..add(LoadingCartEvent()),
                child: CartView()));
      case POST_ROUTE:
        return MaterialPageRoute(builder: (_) => LoadingView());
      case GALLERY_ROUTE:
        return MaterialPageRoute(builder: (_) => GalleryView());
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

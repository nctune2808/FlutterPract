import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/auth/signin/signin_bloc.dart';
import 'package:tolo/auth/signin/signin_view.dart';
import 'package:tolo/auth/signup/signup_bloc.dart';
import 'package:tolo/auth/signup/signup_view.dart';
import 'package:tolo/src/cart/cart_bloc.dart';
import 'package:tolo/src/cart/cart_view.dart';
import 'package:tolo/src/chat/chat_bloc.dart';
import 'package:tolo/src/chat/chat_view.dart';
import 'package:tolo/src/chat/message/message_bloc.dart';
import 'package:tolo/src/gallery/gallery_view.dart';
import 'package:tolo/src/home/home_view.dart';
import 'package:tolo/src/home/welcome_view.dart';
import 'package:tolo/src/wall/post/post_bloc.dart';
import 'package:tolo/src/wall/wall_bloc.dart';
import 'package:tolo/src/wall/wall_view.dart';

const WELCOME_ROUTE = "/";
const SIGNIN_ROUTE = "/signin";
const SIGNUP_ROUTE = "/signup";
const HOME_ROUTE = "/home";
const CART_ROUTE = "/cart";
const WALL_ROUTE = "/wall";
const CHAT_ROUTE = "/chat";
const GALLERY_ROUTE = "/galerry";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WELCOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SessionBloc()..add(InitSessionEvent()),
                  child: WelcomeView(),
                ));
      case SIGNIN_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SigninBloc(), child: SignInView()));
      case SIGNUP_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SignupBloc(), child: SignUpView()));
      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SessionBloc()..add(AuthenSessionEvent()),
                  child: HomeView(),
                ));
      case CART_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => CartBloc()..add(LoadingCartEvent()),
                child: CartView()));
      case WALL_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => WallBloc()..add(FetchWallEvent()),
              lazy: true,
            ),
            BlocProvider(
              create: (context) => PostBloc()..add(InitPostEvent()),
              lazy: true,
            )
          ], child: WallView()),
        );

      case GALLERY_ROUTE:
        return MaterialPageRoute(builder: (_) => GalleryView());
      case CHAT_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => SessionBloc()..add(AuthenSessionEvent()),
            ),
            BlocProvider(
              create: (context) => ChatBloc()..add(InitChatEvent()),
              lazy: true,
            ),
            BlocProvider(
              // combine session bloc provider???
              create: (context) => MessageBloc()..add(InitMessageEvent()),
              lazy: true,
            )
          ], child: ChatView()),
        );

      default:
        return null;
    }
  }
}

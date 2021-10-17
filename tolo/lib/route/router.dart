import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/signin/signin_bloc.dart';
import 'package:tolo/auth/signin/signin_view.dart';
import 'package:tolo/auth/signup/signup_bloc.dart';
import 'package:tolo/auth/signup/signup_view.dart';
import 'package:tolo/src/cart/cart_bloc.dart';
import 'package:tolo/src/cart/cart_view.dart';
import 'package:tolo/src/gallery/gallery_view.dart';
import 'package:tolo/src/home/home_view.dart';
import 'package:tolo/src/home/loading_view.dart';
import 'package:tolo/src/home/welcome_view.dart';
import 'package:tolo/src/talk/talk_bloc.dart';
import 'package:tolo/src/talk/talk_view.dart';
import 'package:tolo/src/timeline/post/post_bloc.dart';
import 'package:tolo/src/timeline/timeline_bloc.dart';
import 'package:tolo/src/timeline/timeline_view.dart';

const WELCOME_ROUTE = "/";
const SIGNIN_ROUTE = "/signin";
const SIGNUP_ROUTE = "/signup";
const HOME_ROUTE = "/home";
const CART_ROUTE = "/cart";
const TIMELINE_ROUTE = "/timeline";
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
      case TIMELINE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => TimelineBloc()..add(FetchTimelineEvent())),
            BlocProvider(
              create: (context) => PostBloc()..add(InitPostEvent()),
              lazy: true,
            )
          ], child: TimelineView()),
        );

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

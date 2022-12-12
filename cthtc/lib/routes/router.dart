
import 'package:cthtc/pages/home_page.dart';
import 'package:cthtc/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const LANDING_PAGE = '/landing';
const HOME_PAGE = '/';
const ABOUT_PAGE = '/about';
const CONTACT_PAGE = '/contact';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LANDING_PAGE:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
    }
  }
}
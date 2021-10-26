import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/route/router.dart';
import 'package:tolo/src/chat/chat_bloc.dart';
import 'package:tolo/src/chat/chat_view.dart';
import 'package:tolo/utility/state/status.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState>(
      listener: (context, state) {
        if (state.status is StatusAuthenticated)
          _showSnackBar(context, "Signed In Successfully");
      },
      child: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          print("--HomeSession:-- ${state.status}");
          if (state.status is StatusAuthenticated) {
            return _scenBuilder(user: state.user!);
          } else {
            return _progressBuilder();
          }
        },
      ),
    );
  }

  Widget _progressBuilder() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Authentication In Progress...", style: TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          LinearProgressIndicator(),
        ],
      ),
    );
  }

  Widget _scenBuilder({required User user}) {
    return Scaffold(
      appBar: _appBar(user: user),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Text("Bottom Bar"),
      ),
      body: _bodyBuilder(),
    );
  }

  AppBar _appBar({required User user}) {
    return AppBar(
      title: Text("Welcome, ${user.username!.toUpperCase()}"),
      leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      actions: [
        IconButton(
          icon: Icon(Icons.logout, size: 30),
          onPressed: () {
            context.read<SessionBloc>().add(UnauthSessionEvent());
            Navigator.popAndPushNamed(context, WELCOME_ROUTE);
          },
        )
      ],
    );
  }

  Widget _bodyBuilder() {
    return GridView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 60, mainAxisSpacing: 60),
      children: [
        _RouteBuilder(page: "CART", icon: Icons.shopping_bag),
        _RouteBuilder(page: "WALL", icon: Icons.list),
        _RouteBuilder(page: "CHAT", icon: Icons.messenger),
        _RouteBuilder(page: "GALLERY", icon: Icons.view_carousel),
        _RouteBuilder(page: "PROFILE", icon: Icons.person_rounded),
      ],
    );
  }

  Widget _RouteBuilder({required String page, required IconData icon}) {
    return ElevatedButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Icon(icon, size: 60), Text(page)],
      ),
      onPressed: () => Navigator.pushNamed(context, "/${page.toLowerCase()}"),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

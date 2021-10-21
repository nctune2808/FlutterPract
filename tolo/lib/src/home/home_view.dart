import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/route/router.dart';
import 'package:tolo/src/chat/chat_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        print("Home ${state.status}");
        return Scaffold(
          appBar: _appBar(user: state.user),
          bottomNavigationBar: BottomAppBar(
            child: Text("Bottom Bar"),
          ),
          body: _bodyBuilder(),
        );
      },
    );
  }

  // Widget _scenBuilder() {
  //   return
  // }

  AppBar _appBar({required User? user}) {
    return AppBar(
      title: (user == null || user.isAnonymous)
          ? Text("HELLO")
          : Text("Welcome, ${user.displayName!.toUpperCase()}"),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout, size: 30),
          onPressed: () {
            context.read<SessionBloc>().add(UnauthSessionEvent());
            Navigator.pop(context);
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
        ElevatedButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.shopping_bag, size: 60), Text("CART")],
          ),
          onPressed: () => Navigator.pushNamed(context, CART_ROUTE),
        ),
        ElevatedButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.list, size: 60), Text("WALL")],
          ),
          onPressed: () => Navigator.pushNamed(context, WALL_ROUTE),
        ),
        ElevatedButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.messenger, size: 60), Text("CHAT")],
          ),
          onPressed: () => Navigator.pushNamed(context, CHAT_ROUTE),
        ),
        ElevatedButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.view_carousel, size: 60), Text("GALLERY")],
          ),
          onPressed: () => Navigator.pushNamed(context, GALLERY_ROUTE),
        ),
      ],
    );
  }
}

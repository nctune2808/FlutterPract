import 'package:flutter/material.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/route/router.dart';

class HomeView extends StatelessWidget {
  final _authRepo = AuthRepository();

  @override
  Widget build(BuildContext context) {
    String? username = _authRepo.getCurrentUser().displayName;
    return Scaffold(
      appBar: AppBar(
        title: username == null
            ? Text("Hello")
            : Text("Welcome, ${username.toUpperCase()}"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, size: 30),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text("Bottom Bar"),
      ),
      body: GridView(
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
              children: [Icon(Icons.list, size: 60), Text("TIMELINE")],
            ),
            onPressed: () => Navigator.pushNamed(context, TIMELINE_ROUTE),
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
      ),
    );
  }
}

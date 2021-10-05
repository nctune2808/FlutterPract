import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoping_list_bloc/route/router.dart';

class HomeView extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Hello ${_auth.currentUser!.email}"), actions: [
        IconButton(
            icon: Icon(Icons.logout, size: 30),
            onPressed: () => Navigator.pop(context))
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Text("Bottom Bar"),
      ),
      body: GridView(
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
              children: [Icon(Icons.list, size: 60), Text("POST")],
            ),
            onPressed: () => Navigator.pushNamed(context, POST_ROUTE),
          ),
          ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.messenger, size: 60), Text("TALK")],
            ),
            onPressed: () => Navigator.pushNamed(context, TALK_ROUTE),
          ),
          ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.view_carousel, size: 60), Text("PHOTO")],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

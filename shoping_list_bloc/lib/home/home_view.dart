import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoping_list_bloc/route/router.dart';

class HomeView extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  User? _user;

  void getCurrentUser() async {
    try {
      if (_auth.currentUser != null) {
        _user = _auth.currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home"),
          leading: IconButton(
              icon: Icon(Icons.logout, size: 30),
              onPressed: () => Navigator.pop(context))),
      body: Center(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.shopping_bag, size: 50),
                    Text("Cart"),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CART_ROUTE);
                },
              ),
              ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.list, size: 50),
                    Text("Post"),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, POST_ROUTE);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

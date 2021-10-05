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
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 50, mainAxisSpacing: 50),
        children: [
          ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.shopping_bag, size: 50), Text("CART")],
            ),
            onPressed: () => Navigator.pushNamed(context, CART_ROUTE),
          ),
          ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.list, size: 50), Text("POST")],
            ),
            onPressed: () => Navigator.pushNamed(context, POST_ROUTE),
          ),
          ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.messenger, size: 50), Text("TALK")],
            ),
            onPressed: () => Navigator.pushNamed(context, TALK_ROUTE),
          ),
          ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.view_carousel, size: 50), Text("PHOTO")],
            ),
            onPressed: () {},
          ),
        ],
      ),
      // child: SizedBox(
      //   height: 80,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       ElevatedButton(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Icon(Icons.shopping_bag, size: 50),
      //             Text("Cart"),
      //           ],
      //         ),
      //         onPressed: () {
      //           Navigator.pushNamed(context, CART_ROUTE);
      //         },
      //       ),
      //       ElevatedButton(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Icon(Icons.list, size: 50),
      //             Text("Post"),
      //           ],
      //         ),
      //         onPressed: () {
      //           Navigator.pushNamed(context, POST_ROUTE);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

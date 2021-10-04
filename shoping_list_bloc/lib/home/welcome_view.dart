import 'package:flutter/material.dart';
import 'package:shoping_list_bloc/route/router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ToLo",
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MaterialButton(
              minWidth: 200,
              color: Colors.lightBlueAccent,
              child: Text("Login"),
              onPressed: () {
                Navigator.pushNamed(context, SIGNIN_ROUTE);
              },
            ),
            MaterialButton(
              minWidth: 200,
              color: Colors.lightBlueAccent,
              child: Text("Register"),
              onPressed: () {
                Navigator.pushNamed(context, SIGNUP_ROUTE);
              },
            ),
          ],
        ),
      ),
    );
  }
}

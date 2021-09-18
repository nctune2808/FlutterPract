import 'package:flutter/material.dart';
import 'package:flutter_backend/services/auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();
  int number = 3;
  int? nulnum = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: RaisedButton(
          child: Text("Sign in Anon"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print("ERROR signin");
            } else {
              print("SUCCESSFUL");
              print(result.uid);

              this.number = 5;
              print("After number" + number.toString());

              this.nulnum = null;
              print("After nullable" + number.toString());
            }
          },
        ),
      ),
    );
  }
}

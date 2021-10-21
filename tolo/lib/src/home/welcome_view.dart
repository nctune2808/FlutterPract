import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/auth_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/route/router.dart';
// import 'package:tolo/route/router.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        print("Welcome ${state.status}");
        return _sceneBuilder();
      },
    );
  }

  Widget _sceneBuilder() {
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
                context.read<SessionBloc>().add(UnauthSessionEvent());
              },
            ),
            MaterialButton(
              minWidth: 200,
              color: Colors.lightBlueAccent,
              child: Text("Register"),
              onPressed: () {
                Navigator.pushNamed(context, SIGNUP_ROUTE);
                context.read<SessionBloc>().add(UnauthSessionEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}

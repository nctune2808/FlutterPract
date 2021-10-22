import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/route/router.dart';
import 'package:tolo/src/home/home_view.dart';
import 'package:tolo/utility/state/status.dart';

import 'signin_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state.status is StatusSucess) {
          _showSnackBar(context, "Signed In Successfully");
          Navigator.pushNamed(context, HOME_ROUTE);
        } else if (state.status is StatusFailed) {
          _showSnackBar(
              context, 'Invalid User!!!\nPlease create account first');
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [_loginForm(), _showSignUpButton()],
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration:
              InputDecoration(icon: Icon(Icons.email), hintText: "Email"),
          validator: (value) {},
          onChanged: (value) {
            // context.read<SigninBloc>().add(SigninUsername(username: value)),
            context.read<SigninBloc>().add(EmailSigninEvent(email: value));
          },
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: "Password"),
          validator: (value) {},
          onChanged: (value) => context
              .read<SigninBloc>()
              .add(PasswordSigninEvent(password: value)),
        );
      },
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailField(),
              _passwordField(),
              _loginButton(),
              _adminButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Flexible(
      // for android test
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          return state.status is StatusSucess
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SigninBloc>().add(SubmissionSigninEvent());
                    }
                  },
                  child: Text('Login'));
        },
      ),
    );
  }

  Widget _adminButton() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return state.status is StatusSucess
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<SigninBloc>().add(FastTrackSignInEvent());
                },
                child: Text('Fast Track'));
      },
    );
  }

  Widget _showSignUpButton() {
    return SafeArea(
      child: TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, SIGNUP_ROUTE);
        },
        child: Text('Don\'t have an account yet? Sign Up'),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

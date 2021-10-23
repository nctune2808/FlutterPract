import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/route/router.dart';
import 'package:tolo/utility/state/status.dart';

import 'signup_bloc.dart';

class SignUpView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _signUpForm(),
          _showSignInButton(context),
        ],
      ),
    );
  }

  Widget _signUpForm() {
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
              _usernameField(),
              _registerButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: "Username"),
          validator: (value) {},
          onChanged: (value) => context
              .read<SignupBloc>()
              .add(UsernameSignupEvent(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: "Password"),
          validator: (value) {},
          onChanged: (value) => context
              .read<SignupBloc>()
              .add(PasswordSignupEvent(password: value)),
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration:
              InputDecoration(icon: Icon(Icons.mail), hintText: "Email"),
          validator: (value) {},
          onChanged: (value) =>
              context.read<SignupBloc>().add(EmailSignupEvent(email: value)),
        );
      },
    );
  }

  Widget _registerButton() {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.status is StatusSucess) {
          _showSnackBar(context, 'Signed Up Successfully');
          Navigator.popAndPushNamed(context, SIGNIN_ROUTE);
        } else if (state.status is StatusFailed) {
          _showSnackBar(context, 'Invalid Email / Weak Password');
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return state.status is StatusLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SignupBloc>().add(SubmissionSignupEvent());
                    }
                  },
                  child: Text('Register'),
                );
        },
      ),
    );
  }

  Widget _showSignInButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, SIGNIN_ROUTE);
        },
        child: Text('Already have an account? Sign In'),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

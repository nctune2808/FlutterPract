import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/route/router.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';

import 'signup_bloc.dart';

class SignUpView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool didClick = false; // basic, set flag

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
              _usernameField(),
              _passwordField(),
              _emailField(),
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
          onChanged: (value) =>
              context.read<SignupBloc>().add(SignupUsername(username: value)),
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
          onChanged: (value) =>
              context.read<SignupBloc>().add(SignupPassword(password: value)),
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
              context.read<SignupBloc>().add(SignupEmail(email: value)),
        );
      },
    );
  }

  Widget _registerButton() {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionSucess) {
          _showSnackBar(context, 'Signed Up Successfully');
          Navigator.popAndPushNamed(context, SIGNIN_ROUTE);
        } else if (formStatus is SubmissionFailed) {
          // _showSnackBar(context, formStatus.exception.toString());
          if (didClick) _showSnackBar(context, 'Invalid Email / Weak Password');
          didClick = false;
        }
      },
      // listenWhen: (previous, current) {
      //   return current.formStatus is SubmissionSucess;
      // },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return state.formStatus is FormSubmitting
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      didClick = true;
                      context.read<SignupBloc>().add(SignupSubmitted());
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/route/router.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';

import 'signin_bloc.dart';

class SignInView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [_loginForm(), _showSignUpButton(context)],
      ),
    );
  }

  // Widget _usernameField() {
  //   return BlocBuilder<SigninBloc, SigninState>(
  //     builder: (context, state) {
  //       return TextFormField(
  //         decoration:
  //             InputDecoration(icon: Icon(Icons.person), hintText: "Username"),
  //         validator: (value) =>
  //             state.isValidEmail ? null : 'Username is too short',
  //         onChanged: (value) =>
  //             context.read<SigninBloc>().add(SigninUsername(username: value)),
  //       );
  //     },
  //   );
  // }

  Widget _emailField() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return TextFormField(
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: "Email"),
          validator: (value) {},
          onChanged: (value) {
            // context.read<SigninBloc>().add(SigninUsername(username: value)),
            context.read<SigninBloc>().add(SigninEmail(email: value));
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
          onChanged: (value) =>
              context.read<SigninBloc>().add(SigninPassword(password: value)),
        );
      },
    );
  }

  Widget _loginForm() {
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionSucess) {
          _showSnackBar(context, "Signed In Successfully");
          Navigator.popAndPushNamed(context, HOME_ROUTE);
        } else if (formStatus is SubmissionFailed) {
          // _showSnackBar(context, formStatus.exception.toString());
          _showSnackBar(
              context, 'Invalid User!!!\nPlease create account first');
        }
        print(formStatus); // keep repeating <============
      },
      child: Form(
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
      ),
    );
  }

  Widget _loginButton() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SigninBloc>().add(SigninSubmitted());
                  }
                },
                child: Text('Login'));
      },
    );
  }

  Widget _adminButton() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return state.formStatus is AdminSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<SigninBloc>().add(FastTrackSubmitted());
                },
                child: Text('Fast Track'));
      },
    );
  }

  Widget _showSignUpButton(BuildContext context) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo_timeline/auth/auth_cubit.dart';
import 'package:tolo_timeline/auth/auth_repository.dart';
import 'package:tolo_timeline/auth/form_submission_status.dart';

import 'signin_bloc.dart';

class SignInView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SigninBloc(
          authRepo: context.read<AuthRepository>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [_loginForm(), _showSignUpButton(context)],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return TextFormField(
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: "Username"),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) =>
              context.read<SigninBloc>().add(SigninUsername(username: value)),
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
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
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
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_usernameField(), _passwordField(), _loginButton()],
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

  Widget _showSignUpButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        onPressed: () => context.read<AuthCubit>().showSignUp(),
        child: Text('Don\'t have an account yet? Sign Up'),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

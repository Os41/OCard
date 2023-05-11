import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required void Function() toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Sign in'),
        ),
      ),
    );
  }
}

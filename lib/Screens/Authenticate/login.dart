import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required void Function() toggleView}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Login'),
        ),
      ),
    );
  }
}

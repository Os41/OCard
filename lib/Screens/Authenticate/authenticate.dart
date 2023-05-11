import 'package:flutter/material.dart';
import 'login.dart';
import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = true;
  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(toggleView: toggleView);
    }
    else {
      return SignIn(toggleView: toggleView);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Screens/Authenticate/security.dart';
import 'package:provider/provider.dart';
import 'Authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return const Authenticate();
    }
    else {
      return const Security();
    }
  }
}
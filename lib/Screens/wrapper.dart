import 'package:flutter/material.dart';
import 'package:o_card/Screens/Authenticate/security.dart';
import 'package:provider/provider.dart';
import '../Models/user.dart';
import 'Authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    }
    else {
      return Security();
    }
  }
}
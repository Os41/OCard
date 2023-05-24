import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class logo extends StatelessWidget {
  const logo();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Container(
        width: 100,
        height: 100.0,
        child: Image(
          image: AssetImage('assets/images/logo-with-name.png'),
          width: 80,
          height: 80.0,
        ),
      ),
    );
  }
}

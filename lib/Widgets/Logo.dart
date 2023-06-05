import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  const logo();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Container(
        width: 100,
        height: 100.0,
        child: const Image(
          image: AssetImage('assets/images/logo/b-logo-t.png'),
          width: 80,
          height: 80.0,
        ),
      ),
    );
  }
}
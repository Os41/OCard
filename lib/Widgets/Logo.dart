import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: SizedBox(
        width: 100,
        height: 100.0,
        child: Image(
          image: AssetImage('assets/images/logo/b-logo-t.png'),
          width: 80,
          height: 80.0,
        ),
      ),
    );
  }
}
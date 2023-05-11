import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../Main/home.dart';
import 'lock.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {

  bool isLocked = true;
  void toggleView() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() => isLocked = !isLocked);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLocked) {
      return Lock(toggleView: toggleView);
    }
    else {
      return Home(toggleView: toggleView);
    }
  }
}

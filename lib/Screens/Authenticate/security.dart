import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:o_card/Services/auth.dart';
import 'package:o_card/constants.dart';
import 'package:provider/provider.dart';
import '../../Models/card.dart';
import '../../Models/user.dart';
import '../../Services/database.dart';
import '../Main/home.dart';
import 'lock.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  UserData? userData;
  List<CreditCard> creditCards = [];
  List<Transaction> transactionsData = [];

  bool isLocked = true;

  void toggleView() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() => isLocked = !isLocked);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      DatabaseService(uid: user.uid)
          .usersRef
          .child(user.uid)
          .onValue
          .listen((event) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final Map<String, dynamic> convertedData =
              Map<String, dynamic>.from(data);

          final UserData formatData = UserData.fromMap(convertedData);
          setState(() {
            userData = formatData;
          });
        }
      });
    }

    if (user != null && userData != null) {
      if (isLocked) {
        return Lock(toggleView: toggleView, user: user, userData: userData);
      } else {
        return Home(toggleView: toggleView, user: user, userData: userData);
      }
    } else {
      return Scaffold(
        backgroundColor: const Color(gBlack),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/searching.gif'),
                width: double.infinity,
                height: 170,
                fit: BoxFit.contain,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Loading...',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                onPressed: () {
                  AuthService().signOut();
                },
                child: const Text(''),
              ),
            )
          ],
        )),
      );
    }
  }
}

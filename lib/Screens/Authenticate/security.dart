import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    if(user != null){
      DatabaseService(uid: user.uid).usersRef.child(user.uid).onValue.listen((event) {
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

      DatabaseService(uid: user.uid).cardsRef.onValue.listen((event) {
        final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
        late List<CreditCard> formatData = [];

        if (data != null) {
          final Map<String, dynamic> convertedData = Map<String, dynamic>.from(data);

          convertedData.forEach((key, value) {
            final Map<String, dynamic> convertedCard = Map<String, dynamic>.from(value);
            formatData.add(CreditCard.fromMap(convertedCard));
          });

          setState(() {
            creditCards = formatData;
          });
        }
      });

      // DatabaseService(uid: user.uid).transactionsRef.onValue.listen((event) {
      //   final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
      //   late List<Transaction> formatData = [];
      //
      //   if (data != null) {
      //     final Map<String, dynamic> convertedData = Map<String, dynamic>.from(data);
      //
      //     convertedData.forEach((key, value) {
      //       final Map<String, dynamic> convertedCard = Map<String, dynamic>.from(value);
      //       formatData.add(Transaction.fromMap(convertedCard));
      //     });
      //
      //     setState(() {
      //       transactionsData = formatData;
      //     });
      //   }
      // });
    }

    if(user != null && userData != null){
      if (isLocked) {
        return Lock(toggleView: toggleView, user: user, userData: userData);
      }
      else {
        return Home(toggleView: toggleView, user: user, userData: userData, creditCards: creditCards);
      }
    }else{
      return const Scaffold(
        body: Center(child: Text('Loading...')),
      );
    }
  }
}

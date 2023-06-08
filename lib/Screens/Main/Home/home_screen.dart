import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../Models/user.dart';
import '../../../Services/database.dart';
import '../../Purchase/purchase_by_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserData? userData;
  int shield = 0;

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
      if(userData != null){
        setState(() {
          shield = userData!.shield;
        });
      }
    }

    return SizedBox(
      width: double.infinity,
      height: 310,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 170,
              height: 320,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(secondaryColor),
                borderRadius: BorderRadius.all(Radius.circular(35))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                        BorderSide(width: 1.0, color: Colors.white60),
                      ),
                    ),
                    child: const Text(
                      'Active card type',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Select type'),
                          content: SizedBox(
                            height: 330,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    DatabaseService(uid: user!.uid).updateUserData('shield', 1);
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom:
                                        BorderSide(width: 1.0, color: Colors.black12),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 90,
                                          padding: const EdgeInsets.only(right: 20),
                                          child: const Image(
                                            image: AssetImage('assets/images/shields/Category-shield.png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 8.0),
                                              child: Text(
                                                  'Category',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(secondaryColor),
                                                  )
                                              ),
                                            ),
                                            Text(
                                                'Categories for each card.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w200,
                                                  color: Color(gray),
                                                )
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    DatabaseService(uid: user!.uid).updateUserData('shield', 2);
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom:
                                        BorderSide(width: 1.0, color: Colors.black12),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 90,
                                          padding: const EdgeInsets.only(right: 20),
                                          child: const Image(
                                            image: AssetImage('assets/images/shields/Percentage-shield.png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 8.0),
                                              child: Text(
                                                  'Percentage',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(secondaryColor),
                                                  )
                                              ),
                                            ),
                                            Text(
                                                'Percentage for each card.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w200,
                                                  color: Color(gray),
                                                )
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    DatabaseService(uid: user!.uid).updateUserData('shield', 3);
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 90,
                                        padding: const EdgeInsets.only(right: 20),
                                        child: const Image(
                                          image: AssetImage('assets/images/shields/Priority-shield.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                                'Priority',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(secondaryColor),
                                                )
                                            ),
                                          ),
                                          Text(
                                              'Priority for each card.',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                                color: Color(gray),
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.infinity,
                      child: Image(
                        image: AssetImage('assets/images/shields/${shieldsList[shield]['image']}'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10.0),
                    alignment: Alignment.center,
                    child: Text(
                      shieldsList[shield]['label'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 170,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(
                  color: Color(secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(35))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                        BorderSide(width: 1.0, color: Colors.white60),
                      ),
                    ),
                    child: const Text(
                      'Use O Card',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PurchaseByCard()));
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/images/logo/logo-big.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
// PurchaseByCard
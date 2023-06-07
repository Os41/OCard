import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/constants.dart';
import 'package:provider/provider.dart';
import '../../Models/card.dart';
import '../../Models/user.dart';
import '../../Services/database.dart';
import '../../Services/utils.dart';
import '../../Widgets/credit_card.dart';

class PurchaseByCard extends StatefulWidget {
  const PurchaseByCard({Key? key}) : super(key: key);

  @override
  State<PurchaseByCard> createState() => _PurchaseByCardState();
}

class _PurchaseByCardState extends State<PurchaseByCard> {
  UserData? userData;
  List<CreditCard> creditCards = [];
  int randomNumber = getRandomNumber();

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
    }

    return Scaffold(
      backgroundColor: const Color(gBlack),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          color: const Color(gBlack),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 35),
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(Radius.circular(35))
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_forward_ios_rounded)
                    ),
                  ),
                  if(userData != null)
                    CreditCardWidget(
                      cardNumber: userData!.oCard.cardNumber,
                      expirationDate: ExpirationDate(month: userData!.oCard.expirationDate.month, year: userData!.oCard.expirationDate.year),
                      cvv: userData!.oCard.cvv,
                      cardholderName: userData!.fullName,
                      styleNumber: randomNumber,
                      isCopy: false
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/searching.gif'),
                      width: double.infinity,
                      height: 170,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white54,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),  // Set the border radius to achieve rounded rectangle shape
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('Pay', style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

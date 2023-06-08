import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Models/credit_card.dart';
import 'package:provider/provider.dart';
import '../../../Models/user.dart';
import '../../../Services/database.dart';
import '../../../Widgets/short_card.dart';
import '../../../Widgets/summarized_container.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  UserData? userData;
  List<CreditCard> creditCards = [];
  List<CreditCard> userCards = [];
  List cardsStyle = [9, 10, 4, 5, 1, 2, 6, 3, 8, 7, 11];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user != null) {
      List<CreditCard> fetchCards = [];
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
      DatabaseService(uid: user.uid).cardsRef.onValue.listen((event) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        late List<CreditCard> formatData = [];

        if (data != null) {
          final Map<String, dynamic> convertedData =
              Map<String, dynamic>.from(data);

          convertedData.forEach((key, value) {
            final Map<String, dynamic> convertedCard =
                Map<String, dynamic>.from(value);
            formatData.add(CreditCard.fromMap(convertedCard));
          });

          setState(() {
            creditCards = formatData;
          });
        }
      });

      for (var card in creditCards) {
        if (userData!.cards.cardsId.contains(card.cid)) {
          setState(() {
            fetchCards.add(card);
          });
        }
      }
      if (fetchCards.isNotEmpty) {
        setState(() {
          userCards = fetchCards;
        });
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: userCards.isNotEmpty ? 240 : 0,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userCards.length,
              itemBuilder: (BuildContext context, int index) {
                var card = userCards[index];
                return ShortCard(
                    cid: card.cid,
                    cardNumber: card.cardNumber,
                    cardholderName: card.cardholderName,
                    expirationDate: card.expirationDate,
                    balance: card.balance,
                    styleNumber: cardsStyle[index]);
              },
            ),
          ),
          userData != null
              ? AddShortCard(cid: creditCards.length, ucid: userData!.cards.cardsId.length)
              : const SizedBox(),
          const SummarizedContainer(
              headerText: 'Spending history',
              footerText: 'See all transactions'),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../Models/card.dart';
import '../../../Services/database.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/credit_card.dart';
import '../Other/history_transactions.dart';

class CardDetails extends StatefulWidget {
  final String cid;
  final int styleNumber;

  const CardDetails({Key? key, required this.cid, required this.styleNumber})
      : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  List<CreditCard> creditCards = [];
  CreditCard? userCard;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
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
        if (card.cid == widget.cid) {
          setState(() {
            userCard = card;
          });
        }
      }
    }


    return Scaffold(
      appBar: AppBar(
          title: const Text("Card Details"),
          centerTitle: true,
          backgroundColor: const Color(secondaryColor)),
      body: userCard == null ? const Center(child: Text('Loading'))
      : Container(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreditCardWidget(
                    cardNumber: userCard!.cardNumber,
                    expirationDate: userCard!.expirationDate,
                    cvv: userCard!.cvv,
                    cardholderName: userCard!.cardholderName,
                    styleNumber: widget.styleNumber,
                    isCopy: true),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12),
                      ),
                    ),
                    child: const Text(
                      'Card information',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(secondaryColor)),
                    )),
                Container(
                  height: 400,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Balance: ',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(secondaryColor)),
                          children: [
                            TextSpan(
                                text: getTotalBalance(userCard!.balance),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Color(secondaryColor))),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Status: ',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(secondaryColor),
                          ),
                          children: [
                            TextSpan(
                                text: userCard!.status,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  backgroundColor: Color(userCard!.status ==
                                              'active'
                                          ? successLabelBackgroundColor
                                          : userCard!.status == 'inactive'
                                              ? warningLabelBackgroundColor
                                              : userCard!.status == 'blocked'
                                                  ? dangerLabelBackgroundColor
                                                  : 0xFF000000)
                                      .withOpacity(0.2),
                                  color: Color(userCard!.status == 'active'
                                      ? successLabelColor
                                      : userCard!.status == 'inactive'
                                          ? warningLabelColor
                                          : userCard!.status == 'blocked'
                                              ? dangerLabelColor
                                              : 0xFF000000),
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Limit: ',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(secondaryColor)),
                          children: [
                            TextSpan(
                                text: getTotalBalance(userCard!.creditLimit),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Color(secondaryColor))),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Transactions: ',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(secondaryColor)),
                              children: [
                                TextSpan(
                                    text: '${userCard!.transactions.length}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Color(secondaryColor))),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryTransactions(cid: userCard!.cid)));
                            },
                            icon: const Icon(
                              Icons.more_horiz_rounded,
                              size: 30,
                              color: Color(secondaryColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Remove card'),
                        content: const Text('Are you sure?'),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              DatabaseService(uid: user!.uid).removeNewCardToUser(context, userCard!.cid);
                            },
                            child: const Text('Remove', style: TextStyle(color: Color(redLC)),),
                          )
                        ],
                      );
                    })
              },
              textColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'Remove',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

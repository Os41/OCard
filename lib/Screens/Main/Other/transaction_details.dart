import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Models/card.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../Services/database.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/purchased_row_button.dart';

class TransactionDetails extends StatefulWidget {
  final Transaction transaction;

  const TransactionDetails({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  List<CreditCard> creditCards = [];

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
    }

    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        90;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Details"),
        centerTitle: true,
        backgroundColor: const Color(secondaryColor),
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: screenHeight,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.55,
              decoration: const BoxDecoration(
                color: Color(secondaryColor),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          capitalizeFirstLetter(widget.transaction.name),
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          capitalizeFirstLetter(widget.transaction.category),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        widget.transaction.description,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/images/BrandsLogos/${widget.transaction.image}'),
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '-${getTotalBalance(widget.transaction.amount)}',
                          style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        formatTimestamp(widget.transaction.timestamp),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Type',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/shields/${capitalizeFirstLetter(widget.transaction.type)}-shield.png'),
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                widget.transaction.type,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Status',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(widget.transaction.status ==
                                          'completed'
                                      ? lGreen
                                      : widget.transaction.status == 'pending'
                                          ? warningLabelColor
                                          : dangerLabelColor),
                                ),
                              ),
                              Text(
                                widget.transaction.status,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: screenHeight * 0.45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.transaction.paid.length,
                  itemBuilder: (BuildContext context, int index) {
                    var card = widget.transaction.paid[index];
                    var more = '';
                    if (widget.transaction.type == 'percentage') {
                      var perc = ((card.cost / widget.transaction.amount) * 100)
                          .toInt();
                      more = 'Percentage: $perc%';
                    } else if (widget.transaction.type == 'category') {
                      more =
                          '${capitalizeFirstLetter(widget.transaction.category)} Category: ${index == 0 ? 'First' : index == 1 ? 'Second' : index == 2 ? 'Third' : 'Fourth'}';
                    } else if (widget.transaction.type == 'priority') {
                      more =
                          'Priority: ${index == 0 ? 'First' : index == 1 ? 'Second' : index == 2 ? 'Third' : 'Fourth'}';
                    }
                    CreditCard? cardData = creditCards
                        .firstWhereOrNull((element) => element.cid == card.cid);

                    if (cardData != null) {
                      return PurchasedRowButton(
                        name: cardData.cardNumber,
                        more: more,
                        cost: card.cost,
                        image: getInitials(cardData.cardholderName),
                        shortName: true,
                        underline: true,
                        onPressed: () => {},
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}

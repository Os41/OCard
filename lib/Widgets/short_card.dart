import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Screens/Main/Card/add_card.dart';
import '../Models/expiration_date.dart';
import '../constants.dart';
import '../Screens/Main/Card/card_details.dart';
import '../Services/utils.dart';

class ShortCard extends StatelessWidget {
  final String cid;
  final String cardNumber;
  final String cardholderName;
  final ExpirationDate expirationDate;
  final double balance;
  final int styleNumber;

  const ShortCard({Key? key, required this.cid, required this.cardNumber, required this.cardholderName, required this.expirationDate, required this.balance, required this.styleNumber}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetails(cid: cid, styleNumber: styleNumber)))
      },
      child: Container(
        width: 175,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: Color(secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(35))
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cards/scard-$styleNumber.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(35))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                getLastNumber(cardNumber),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              cardholderName,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.credit_card_rounded, color: Colors.white)
                      ],
                    ),
                    Text(
                      getExpirationDateFormat(expirationDate.month, expirationDate.year),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                  color: Color(secondaryColor),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))
              ),
              child: Text(
                getTotalBalance(balance),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddShortCard extends StatelessWidget {
  final int cid;
  final int ucid;
  const AddShortCard({Key? key, required this.cid, required this.ucid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddCard(cid: cid, ucid: ucid,)))
      },
      child: Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: const Color(secondaryColor).withOpacity(0.05),
            borderRadius: const BorderRadius.all(Radius.circular(35))
        ),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.black,
          dashPattern: const [10, 10],
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
          radius:  const Radius.circular(35),
          child: const SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_card_rounded, color: Color(secondaryColor), size: 30,),
                Text(
                  'Add new card',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(secondaryColor)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/expiration_date.dart';
import '../Services/utils.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final ExpirationDate expirationDate;
  final String cvv;
  final String cardholderName;
  final int styleNumber;
  final bool isCopy;
  final bool isSmall;

  const CreditCardWidget(
      {Key? key,
      required this.cardNumber,
      required this.expirationDate,
      required this.cvv,
      required this.cardholderName,
      required this.styleNumber,
      required this.isCopy, required this.isSmall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cards/card-$styleNumber.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(35))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(
                  'assets/images/${detectCardType(cardNumber).isNotEmpty ? '${detectCardType(cardNumber)}Logo.png' : 'logo/w-logo.png'}'),
              width: 50.0,
              height: 50.0,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    getCardNumberFormat(cardNumber),
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                if (isCopy)
                  IconButton(
                      onPressed: () =>
                          {Clipboard.setData(ClipboardData(text: cardNumber))},
                      icon: const Icon(Icons.copy_rounded,
                          color: Colors.white, size: 30))
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  expirationDate.month != 0 || expirationDate.year != 0
                      ? getExpirationDateFormat(
                          expirationDate.month, expirationDate.year)
                      : '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
                const SizedBox(width: 150),
                Text(
                  cvv,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              cardholderName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

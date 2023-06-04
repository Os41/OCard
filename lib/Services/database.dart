import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:o_card/Models/card.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // Reference
  final DatabaseReference usersRef =
      FirebaseDatabase.instance.ref().child('users');
  final DatabaseReference cardsRef =
      FirebaseDatabase.instance.ref().child('cards');
  final DatabaseReference transactionsRef =
      FirebaseDatabase.instance.ref().child('transactions');

  void updateUserData(String key, dynamic value) {
    usersRef.child(uid).update({
      key: value,
    }).then((value) {
      print('User $key updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });

  }

  void addNewCardToUser(BuildContext context, int number, CreditCard newCard) async {
    usersRef.child('$uid/cards/cards_id').update({
      '$number': newCard.cid,
    }).then((value) {
      print('User Card id updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
    
    cardsRef.child(newCard.cid).set({
      'cid': newCard.cid,
      'uid': newCard.uid,
      'cardholder_name': newCard.cardholderName,
      'cvv': newCard.cvv,
      'balance': newCard.balance,
      'card_number': newCard.cardNumber,
      'expiration_date': {
        'month': newCard.expirationDate.month,
        'year': newCard.expirationDate.year
      },
      'card_type': newCard.cardType,
      'status': newCard.status,
      'bank_name': newCard.bankName,
      'credit_limit': newCard.creditLimit,
      'transactions': newCard.transactions
    }).then((value) {
      print('Cards updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });

    Navigator.pop(context);
  }

  void removeNewCardToUser(BuildContext context, String cid) async {
    DataSnapshot cards = await usersRef.child(uid).get();
    Object? as = cards.child('cards/cards_id').value;
    List<dynamic> modifiedArray = (as as Iterable<dynamic>).toList();
    modifiedArray.removeWhere((item) => item == cid);

    usersRef.child('$uid/cards/cards_id').set(modifiedArray).then((value) {
      print('User Card id updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });

    Navigator.pop(context);
    Navigator.pop(context);
  }
}

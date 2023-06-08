import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:o_card/Models/card.dart';
import 'package:o_card/Services/utils.dart';

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

  // User
  void addNewUserData(String email) async {
    usersRef.child(uid).set({
      'cards': {
        'cards_id': [''],
        'categories': {
          'charitable': [''],
          'drinks':[''],
          'education':[''],
          'entertainment':[''],
          'financial':[''],
          'food':[''],
          'gifts':[''],
          'groceries':[''],
          'health':[''],
          'home':[''],
          'in_app_purchases':[''],
          'miscellaneous':[''],
          'shopping':[''],
          'taxes':[''],
          'transportation':[''],
          'utilities':['']
        },
        'percentages': [{'cid': '', 'percentage': 0}],
        'priorities': ['']
      },
      'date_of_birth': "",
      'email': email,
      'employment_status': "other",
      'fname': "Test",
      'image': "assets/images/Test.jpg",
      'income_range':"2,000 SAR and below",
      'lname':"User",
      'o_card': {
        'card_number': getNewCardNumber(),
        'cvv': getNewCvvNumber(),
        'expiration_date': {
          'month': 9,
          'year': 27
        }
      },
      'passcode': "000000",
      'phone_number': "",
      'puid':"",
      'shield': 0,
      'source_of_income': "other",
      'uid': uid
    }).then((value) {
      print('Added user data successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
  }
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
    Object? cardsId = cards.child('cards/cards_id').value;
    List<dynamic> modifiedArray = (cardsId as Iterable<dynamic>).toList();
    modifiedArray.removeWhere((item) => item == cid);

    usersRef.child('$uid/cards/cards_id').set(modifiedArray).then((value) {
      print('User Card id updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });

    Navigator.pop(context);
    Navigator.pop(context);
  }

  // Priorities
  void updatePrioritiesList(List<String> cardsList) async {
    usersRef.child('$uid/cards/priorities').set(cardsList).then((value) {
      print('User Card priorities updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
  }
  void addPrioritiesCard(String cid) async {
    DataSnapshot cards = await usersRef.child(uid).get();
    Object? prioritiesList = cards.child('cards/priorities').value;
    List<dynamic> modifiedArray = (prioritiesList as Iterable<dynamic>)
        .where((item) => item.isNotEmpty)
        .toList();

    usersRef.child('$uid/cards/priorities').update({
      '${modifiedArray.length}': cid
    }).then((value) {
      print('User Card priorities updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
  }

  // Categories
  void updateCategoriesTypeList(List<String> cardsList, String type) async {
    usersRef.child('$uid/cards/categories/$type').set(cardsList).then((value) {
      print('User Card categories $type updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
  }
  void addCategoriesTypeCard(String cid, String type) async {
    DataSnapshot cards = await usersRef.child(uid).get();
    Object? prioritiesList = cards.child('cards/categories/$type').value;
    List<dynamic> modifiedArray = (prioritiesList as Iterable<dynamic>).where((item) => item.isNotEmpty)
        .toList();

    usersRef.child('$uid/cards/categories/$type').update({
      '${modifiedArray.length}': cid
    }).then((value) {
      print('User Card categories $type updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
  }

  // Percentages
  void updatePercentagesList(List<Percentage> cardsList) async {
    List jsonList = cardsList.map((card) => card.toJson()).toList();
    usersRef.child('$uid/cards/percentages').set(jsonList).then((value) {
      print('User Card percentages updated successfully');
    }).catchError((error) {
      print('Failed to update user: $error');
    });
  }
}

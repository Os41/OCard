import 'package:o_card/Models/paid.dart';

import 'credit_card.dart';

class Transaction {
  final String tid;
  final int timestamp;
  final String uid;
  final String name;
  final String category;
  final String image;
  final double amount;
  final String currency;
  final String description;
  final String status;
  final String type;
  final String sourceAccount;
  final String destinationAccount;
  final List<Paid> paid;

  Transaction({
    required this.tid,
    required this.timestamp,
    required this.uid,
    required this.name,
    required this.category,
    required this.image,
    required this.amount,
    required this.currency,
    required this.description,
    required this.status,
    required this.type,
    required this.sourceAccount,
    required this.destinationAccount,
    required this.paid
  });


  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        tid: map['tid'],
        timestamp: map['timestamp'],
        uid: map['uid'],
        name: map['name'],
        category: map['category'],
        image: map['image'],
        amount: map['amount'].toDouble(),
        currency: map['currency'],
        description: map['description'],
        status: map['status'],
        type: map['type'],
        sourceAccount: map['source_account'],
        destinationAccount: map['destination_account'],
        paid: _parsePaid(map['paid'])
    );
  }
  static List<Paid> _parsePaid(List<dynamic> paid) {
    return paid.map((item) {
      return Paid(
        cid: item['cid'],
        cost: item['cost'].toDouble(),
      );
    }).toList();
  }
}

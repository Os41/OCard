import 'expiration_date.dart';

class CreditCard {
  final String cid;
  final String uid;
  final String cardholderName;
  final String cvv;
  final double balance;
  final String cardNumber;
  final ExpirationDate expirationDate;
  final String cardType;
  final String status;
  final String bankName;
  final double creditLimit;
  final List<String> transactions;

  CreditCard({
    required this.cid,
    required this.uid,
    required this.cardholderName,
    required this.cvv,
    required this.balance,
    required this.cardNumber,
    required this.expirationDate,
    required this.cardType,
    required this.status,
    required this.bankName,
    required this.creditLimit,
    required this.transactions
  });

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> convertedData = Map<String, dynamic>.from(map['expiration_date']);

    return CreditCard(
      cid: map['cid'],
      uid: map['uid'],
      cardholderName: map['cardholder_name'],
      cvv: map['cvv'],
      balance: map['balance'].toDouble(),
      cardNumber: map['card_number'],
      expirationDate: ExpirationDate.fromMap(convertedData),
      cardType: map['card_type'],
      status: map['status'],
      bankName: map['bank_name'],
      creditLimit: map['credit_limit'].toDouble(),
      transactions: List<String>.from(map['transactions'])
    );
  }
}

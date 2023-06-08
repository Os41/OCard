import 'expiration_date.dart';

class OCard {
  final String cvv;
  final String cardNumber;
  final ExpirationDate expirationDate;

  OCard({
    required this.cvv,
    required this.cardNumber,
    required this.expirationDate,
  });

  factory OCard.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> convertedData = Map<String, dynamic>.from(map['expiration_date']);

    return OCard(
        cvv: map['cvv'],
        cardNumber: map['card_number'],
        expirationDate: ExpirationDate.fromMap(convertedData)
    );
  }
}

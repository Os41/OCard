import 'card.dart';

class UserData {
  final String uid;
  final String fullName;
  final String puid;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String passcode;
  final String image;
  final String sourceOfIncome;
  final String incomeRange;
  final String employmentStatus;
  final int shield;
  final CardList cards;
  final OCard oCard;

  UserData({
    required this.uid,
    required this.fullName,
    required this.puid,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.passcode,
    required this.image,
    required this.sourceOfIncome,
    required this.incomeRange,
    required this.employmentStatus,
    required this.shield,
    required this.cards,
    required this.oCard
  });

  factory UserData.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> convertedCardsData = Map<String, dynamic>.from(map['cards']);
    final Map<String, dynamic> convertedOCardData = Map<String, dynamic>.from(map['o_card']);

    return UserData(
      uid: map['uid'],
      fullName: map['fname']+' '+map['lname'],
      puid: map['puid'],
      email: map['email'],
      phoneNumber: map['phone_number'],
      dateOfBirth: map['date_of_birth'],
      passcode: map['passcode'],
      image: map['image'],
      sourceOfIncome: map['source_of_income'],
      incomeRange: map['income_range'],
      employmentStatus: map['employment_status'],
      shield: map['shield'],
      cards: CardList.fromMap(convertedCardsData),
      oCard: OCard.fromMap(convertedOCardData),
    );
  }
}


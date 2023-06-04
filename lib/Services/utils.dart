import 'dart:math';
import 'package:intl/intl.dart';
import '../Models/card.dart';

double fetchTotalBalance(String uid, List<CreditCard> creditCards) {
  double totalBalance = 0.0;
  try {
    for (var card in creditCards) {
      if(card.uid == uid){
        totalBalance += card.balance;
      }
    }
  } catch (e) {
    print('Failed to calculate total balance: $e');
  }
  return totalBalance;
}

String getTotalBalance(double balance) {
  double sum = 0.00;
  sum = balance;
  NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

  String formattedNumber = formatter.format(sum);

  return "\$ $formattedNumber";
}

String getCardNumberFormat(String number) {
  return number.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
}

String getExpirationDateFormat(int month, int year) {
  return '$month/$year';
}

String getLastNumber(String number) {
  return '**** ${number.substring(number.length - 4, number.length)}';
}

String getInitials(String cardholderName) {
  List<String> names = cardholderName.split(' ');
  String firstName = names[0];
  String lastName = names.length > 1 ? names[names.length - 1] : '';

  String initials = firstName.isNotEmpty ? firstName[0] : '';
  if (lastName.isNotEmpty) {
    initials += lastName[0];
  }

  return initials.toUpperCase();
}



List calculateValues(data) {
  return data.map((item) {
    double percentage = item['percentage'] / 100;
    return 300 * percentage;
  }).toList();
}

List<int> createRandomNumberList(int length) {
  Random random = Random();
  List<int> numbers = [];

  while (numbers.length < length) {
    int randomNumber = random.nextInt(11) + 1;
    if (!numbers.contains(randomNumber)) {
      numbers.add(randomNumber);
    }
  }

  return numbers;
}
int getRandomNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(11) + 1;

  return randomNumber;
}


String detectCardType(String cardNumber) {
  String cleanedNumber = cardNumber.replaceAll(RegExp(r'\D+'), '');

  if (cleanedNumber.startsWith('4')) {
    if (cleanedNumber.length == 13 || cleanedNumber.length == 16) {
      return 'Visa';
    }
  } else if (cleanedNumber.startsWith('5')) {
    if (cleanedNumber.length == 16) {
      return 'Mastercard';
    }
  }
  return '';
}

bool hasFirstAndLastName(String fullName) {
  List<String> words = fullName.trim().split(' ');
  return words.length >= 2;
}

bool isStringEmpty(String str) {
  return str.trim().isEmpty;
}

bool containsOnlyNumbers(String str) {
  const pattern = r'^[0-9]+$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(str);
}

bool containsOnlyLetters(String str) {
  const pattern = r'^[a-zA-Z]+$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(str);
}

bool containsOnlyLettersAndSpaces(String str) {
  const pattern = r'^[a-zA-Z\s]+$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(str);
}

List<dynamic> getAllTransactions(List<CreditCard> allCard) {
  Set<dynamic> transactions = {};

  for (var card in allCard) {
    List<dynamic> cardTransactions = card.transactions;
    transactions.addAll(cardTransactions);
  }

  return transactions.toList();
}

List<Transaction> cutList(List<Transaction> originalList) {
  if (originalList.length <= 4) {
    return originalList;
  } else {
    return originalList.sublist(0, 4);
  }
}

String capitalizeFirstLetter(String text) {
  if (text == null || text.isEmpty) {
    return text;
  }
  return text.substring(0, 1).toUpperCase() + text.substring(1);
}

String formatTimestamp(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  return formattedDateTime;
}

List<String> findMissingCids(Map<String, dynamic> data) {
  List<String> allCids = data['cards_id'];
  List<Map<String, dynamic>> percentages = data['percentages'];
  List<String> missingCids = [];
  for (String cid in allCids) {
    bool cidExists = false;
    for (Map<String, dynamic> item in percentages) {
      if (item['cid'] == cid) {
        cidExists = true;
        break;
      }
    }
    if (!cidExists) {
      missingCids.add(cid);
    }
  }
  return missingCids;
}

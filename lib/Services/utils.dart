import 'dart:math';
import 'package:intl/intl.dart';
import '../Models/category.dart';
import '../Models/credit_card.dart';
import '../Models/percentage.dart';
import '../Models/transaction.dart';

double fetchTotalBalance(String uid, List<CreditCard> creditCards) {
  double totalBalance = 0.0;
  try {
    for (var card in creditCards) {
      if (card.uid == uid) {
        totalBalance += card.balance;
      }
    }
  } catch (e) {
    // print('Failed to calculate total balance: $e');
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
  return number.replaceAllMapped(
      RegExp(r".{4}"), (match) => "${match.group(0)} ");
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

List calculateValues(List<Percentage>? data) {
  return data!.map((item) {
    double percentage = item.percentage / 100;
    return 270 * percentage;
  }).toList();
}

String getNewCardNumber() {
  Random random = Random();
  int min = 1000000;
  int max = 9999999;
  int randomNumber1 = random.nextInt(max - min + 1) + min;
  int randomNumber2 = random.nextInt(max - min + 1) + min;
  return '9$randomNumber1$randomNumber2';
}

String getNewCvvNumber() {
  Random random = Random();
  int min = 100;
  int max = 999;
  int newCvvNumber = random.nextInt(max - min + 1) + min;
  return newCvvNumber.toString();
}

List calculateValuesController(List? data) {
  return data!.map((item) {
    double percentage = 0;
    if(item.text.length > 0) {
      percentage = int.parse(item.text) / 100;
    }
    return 270 * percentage;
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
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  return formattedDateTime;
}

List<String> findMissingCid(List<String> allCid, List<String> list) {
  List<String> missingCids = [];
  for (String cid in allCid) {
    bool cidExists = false;
    for (String item in list) {
      if (item == cid) {
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

List<String> findMissingCidPercentage(
    List<String> allCid, List<Percentage>? list) {
  List<String> missingCids = [];
  for (String cid in allCid) {
    bool cidExists = false;
    for (int i = 0; i < list!.length; i++) {
      if (list[i].cid == cid) {
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

bool isEmailValid(String email) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

bool isPasswordValid(String password) {
  return password.length >= 8;
}

List<String> getCategoryType(Category? data, int type) {
  if (data != null) {
    switch (type) {
      case 0:
        return data.food;
      case 1:
        return data.drinks;
      case 2:
        return data.groceries;
      case 3:
        return data.transportation;
      case 4:
        return data.entertainment;
      case 5:
        return data.education;
      case 6:
        return data.health;
      case 7:
        return data.shopping;
      case 8:
        return data.home;
      case 9:
        return data.utilities;
      case 10:
        return data.inAppPurchases;
      case 11:
        return data.financial;
      case 12:
        return data.charitable;
      case 13:
        return data.gifts;
      case 14:
        return data.taxes;
      case 15:
        return data.miscellaneous;
    }
  }
  return [];
}

Category? copyCategoryType(Category filteredCategory, int index, List<String> filteredList) {
    switch (index) {
      case 0:
        return filteredCategory.copyWith(food: filteredList);
      case 1:
        return filteredCategory.copyWith(drinks: filteredList);
      case 2:
        return filteredCategory.copyWith(groceries: filteredList);
      case 3:
        return filteredCategory.copyWith(transportation: filteredList);
      case 4:
        return filteredCategory.copyWith(entertainment: filteredList);
      case 5:
        return filteredCategory.copyWith(education: filteredList);
      case 6:
        return filteredCategory.copyWith(health: filteredList);
      case 7:
        return filteredCategory.copyWith(shopping: filteredList);
      case 8:
        return filteredCategory.copyWith(home: filteredList);
      case 9:
        return filteredCategory.copyWith(utilities: filteredList);
      case 10:
        return filteredCategory.copyWith(inAppPurchases: filteredList);
      case 11:
        return filteredCategory.copyWith(financial: filteredList);
      case 12:
        return filteredCategory.copyWith(charitable: filteredList);
      case 13:
        return filteredCategory.copyWith(gifts: filteredList);
      case 14:
        return filteredCategory.copyWith(taxes: filteredList);
      case 15:
        return filteredCategory.copyWith(miscellaneous: filteredList);
      default:
        break;
    }
    return null;
}

String getCardNumberOrName(
    List<CreditCard> creditCards, String cid, bool getName) {
  var cardNumber = '';
  var cardholderName = '';
  for (final card in creditCards) {
    if (card.cid == cid) {
      cardNumber = getCardNumberFormat(card.cardNumber);
      cardholderName = getInitials(card.cardholderName);
      break;
    }
  }
  return getName ? cardholderName : cardNumber;
}

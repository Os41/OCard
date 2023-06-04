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

class ExpirationDate {
  final int month;
  final int year;

  ExpirationDate({
    required this.month,
    required this.year,
  });

  factory ExpirationDate.fromMap(Map<String, dynamic> map) {
    return ExpirationDate(
        month: map['month'],
        year: map['year']
    );
  }
}

class CardList{
  final List<String> cardsId;
  final List<String> priorities;
  final Category? categories;
  final List<Percentage>? percentages;

  CardList({
    required this.cardsId,
    required this.priorities,
    this.categories,
    this.percentages
  });

  factory CardList.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      throw ArgumentError('map cannot be null');
    }
    final Map<String, dynamic> convertedData = Map<String, dynamic>.from(map['categories']);

    return CardList(
      cardsId: List<String>.from(map['cards_id']),
      priorities: List<String>.from(map['priorities']),
      categories: Category.fromMap(convertedData),
      percentages: _parsePercentages(map['percentages']),
    );
  }

  static List<Percentage> _parsePercentages(List<dynamic> percentages) {
    return percentages.map((item) {
      return Percentage(
        cid: item['cid'],
        percentage: item['percentage'],
      );
    }).toList();
  }
}

class Percentage {
  final String cid;
  final int percentage;

  Percentage({
    required this.cid,
    required this.percentage,
  });
}

class Category {
  final List<String> food;
  final List<String> drinks;
  final List<String> groceries;
  final List<String> transportation;
  final List<String> entertainment;
  final List<String> education;
  final List<String> health;
  final List<String> shopping;
  final List<String> home;
  final List<String> utilities;
  final List<String> inAppPurchases;
  final List<String> financial;
  final List<String> charitable;
  final List<String> gifts;
  final List<String> taxes;
  final List<String> miscellaneous;

  Category({
    required this.food,
    required this.drinks,
    required this.groceries,
    required this.transportation,
    required this.entertainment,
    required this.education,
    required this.health,
    required this.shopping,
    required this.home,
    required this.utilities,
    required this.inAppPurchases,
    required this.financial,
    required this.charitable,
    required this.gifts,
    required this.taxes,
    required this.miscellaneous
  });


  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      food: List<String>.from(map['food']),
      drinks: List<String>.from(map['drinks']),
      groceries: List<String>.from(map['groceries']),
      transportation: List<String>.from(map['transportation']),
      entertainment: List<String>.from(map['entertainment']),
      education: List<String>.from(map['education']),
      health: List<String>.from(map['health']),
      shopping: List<String>.from(map['shopping']),
      home: List<String>.from(map['home']),
      utilities: List<String>.from(map['utilities']),
      inAppPurchases: List<String>.from(map['in_app_purchases']),
      financial: List<String>.from(map['financial']),
      charitable: List<String>.from(map['charitable']),
      gifts: List<String>.from(map['gifts']),
      taxes: List<String>.from(map['taxes']),
      miscellaneous: List<String>.from(map['miscellaneous']),
    );
  }
}

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

class Paid {
  final String cid;
  final double cost;

  Paid({
    required this.cid,
    required this.cost,
  });
}

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
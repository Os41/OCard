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

  Category copyWith({
    List<String>? food,
    List<String>? drinks,
    List<String>? groceries,
    List<String>? transportation,
    List<String>? entertainment,
    List<String>? education,
    List<String>? health,
    List<String>? shopping,
    List<String>? home,
    List<String>? utilities,
    List<String>? inAppPurchases,
    List<String>? financial,
    List<String>? charitable,
    List<String>? gifts,
    List<String>? taxes,
    List<String>? miscellaneous
  }) {
    return Category(
        food: food ?? this.food,
        drinks: drinks ?? this.drinks,
        groceries: groceries ?? this.groceries,
        transportation: transportation ?? this.transportation,
        entertainment: entertainment ?? this.entertainment,
        education: education ?? this.education,
        health: health ?? this.health,
        shopping: shopping ?? this.shopping,
        home: home ?? this.home,
        utilities: utilities ?? this.utilities,
        inAppPurchases: inAppPurchases ?? this.inAppPurchases,
        financial: financial ?? this.financial,
        charitable: charitable ?? this.charitable,
        gifts: gifts ?? this.gifts,
        taxes: taxes ?? this.taxes,
        miscellaneous: miscellaneous ?? this.miscellaneous
    );
  }
}

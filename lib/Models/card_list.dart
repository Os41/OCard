import 'package:o_card/Models/percentage.dart';
import 'category.dart';

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
    final Map<String, dynamic> convertedData = Map<String, dynamic>.from(map['categories']);

    return CardList(
      cardsId: List<String>.from(map['cards_id']),
      priorities: List<String>.from(map['priorities']),
      categories: Category.fromMap(convertedData),
      percentages: _parsePercentages(map['percentages']),
    );
  }

  static List<Percentage>? _parsePercentages(List<dynamic> percentages) {
    return percentages.map((item) {
      return Percentage(
        cid: item['cid'],
        percentage: item['percentage'],
      );
    }).toList();
  }
}

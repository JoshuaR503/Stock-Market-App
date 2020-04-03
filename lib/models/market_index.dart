import 'package:meta/meta.dart';

class MarketIndex {
  final String symbol;
  final String name;
  final double price;
  final double changesPercentage;
  final double change;

  MarketIndex({
    @required this.symbol,
    @required this.name,
    @required this.price,
    @required this.changesPercentage,
    @required this.change
  });

  factory MarketIndex.fromJson(Map<String, dynamic> json) {
    return MarketIndex(
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'],
      changesPercentage: json['changesPercentage'],
      change: json['change'],
    );
  }

}

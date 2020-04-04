import 'package:meta/meta.dart';

class DataOverview {
  final String symbol;
  final String name;
  final double price;
  final double changesPercentage;
  final double change;

  DataOverview({
    @required this.symbol,
    @required this.name,
    @required this.price,
    @required this.changesPercentage,
    @required this.change
  });

  factory DataOverview.fromJson(Map<String, dynamic> json) {
    return DataOverview(
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'],
      changesPercentage: json['changesPercentage'],
      change: json['change'],
    );
  }
}

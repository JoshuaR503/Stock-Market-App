import 'package:meta/meta.dart';

class StockSearch {
  final String symbol;

  StockSearch({
    @required this.symbol,
  });

  static List<StockSearch> convertToList({
    @required List<dynamic> items, 
    @required String key
  }) {
    return items
    .map((item) => StockSearch.fromJson(json: item, key: key))
    .toList();
  }
  
  factory StockSearch.fromJson({
    @required Map<String, dynamic> json,
    @required String key
  }) {
    return StockSearch(symbol: json[key]);
  }

}
import 'package:meta/meta.dart';

enum ListType {
  searchHistory, 
  searchResults
}

class StockSearch {
  final String symbol;

  StockSearch({
    @required this.symbol,
  });

  static List<StockSearch> convertToList(List<dynamic> items) {
    return items
    .map((item) => StockSearch.fromJson(item))
    .toList();
  }
  
  factory StockSearch.fromJson( Map<String, dynamic> json) {
    return StockSearch(symbol: json['1. symbol']);
  }

}
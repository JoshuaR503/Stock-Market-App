import 'package:flutter/foundation.dart';

class SearchHistory {
  final String symbol;
  int id;

  SearchHistory({
    @required this.symbol,
    @required this.id
  });

  static List<SearchHistory> convertToList(List<dynamic> json) {
    
    final List<SearchHistory> list = [];

    json.forEach((data) {

      final SearchHistory stock = SearchHistory.fromJson(data);
      
      list.add(stock);
    });

    return list;
  }

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
      id: json['id'],
      symbol: json['symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['id'] = this.id;

    return data;
  }
}
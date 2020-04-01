class StockSearch {
  final String s1Symbol;

  StockSearch({
    this.s1Symbol,
  });

  static List<StockSearch> convertToList(List<dynamic> json) {
    
    final List<StockSearch> list = [];

    json.forEach((data) {
      final StockSearch stock = StockSearch.fromJson(data);
      list.add(stock);
    });

    return list;
  }

  factory StockSearch.fromJson(Map<String, dynamic> json) {
    return StockSearch(
      s1Symbol:json['1. symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['1. symbol'] = this.s1Symbol;

    return data;
  }
}
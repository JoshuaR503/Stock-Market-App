class StockSearch {
  final String s1Symbol;
  final String s2Name;
  final String s3Type;

  StockSearch({
    this.s1Symbol,
    this.s2Name,
    this.s3Type,
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
      s2Name:json['2. name'],
      s3Type:json['3. type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['1. symbol'] = this.s1Symbol;
    data['2. name'] = this.s2Name;
    data['3. type'] = this.s3Type;

    return data;
  }
}
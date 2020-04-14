class MarketIndexModel {
  final String ticker;
  final double changes;
  final double price;
  final String indexName;

  MarketIndexModel({
    this.ticker, 
    this.changes, 
    this.price, 
    this.indexName
  });

  static List<MarketIndexModel> toList(List<dynamic> items) {
    return items
    .map((item) => MarketIndexModel.fromJson(item))
    .toList();
  }

  factory MarketIndexModel.fromJson(Map<String, dynamic> json) {
    return MarketIndexModel(
      ticker: json['ticker'],
      changes: json['changes'],
      price: json['price'],
      indexName: json['indexName'],
    );
  }
}
class StockOverview {
  final String symbol;
  final String name;
  final double price;
  final double changesPercentage;

  StockOverview({this.symbol, this.name, this.price, this.changesPercentage});

  factory StockOverview.fromJson(Map<String, dynamic> json) {
    return StockOverview(
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'],
      changesPercentage: json['changesPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['price'] = this.price;
    data['changesPercentage'] = this.changesPercentage;
    return data;
  }
}
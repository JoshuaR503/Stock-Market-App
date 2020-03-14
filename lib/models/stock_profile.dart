class StockProfile {
  String symbol;
  String name;
  double price;
  double changesPercentage;

  StockProfile({this.symbol, this.name, this.price, this.changesPercentage});

  factory StockProfile.fromJson(Map<String, dynamic> json) {
    return StockProfile(
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
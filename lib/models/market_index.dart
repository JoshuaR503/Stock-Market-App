class MarketIndex {
  String ticker;
  double changes;
  double price;
  String indexName;

  MarketIndex({this.ticker, this.changes, this.price, this.indexName});

  MarketIndex.fromJson(Map<String, dynamic> json) {
    ticker = json['ticker'];
    changes = json['changes'];
    price = json['price'];
    indexName = json['indexName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticker'] = this.ticker;
    data['changes'] = this.changes;
    data['price'] = this.price;
    data['indexName'] = this.indexName;
    return data;
  }
}
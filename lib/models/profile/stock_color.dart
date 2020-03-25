class StockChangeColor {
  final double changesPercentage;

  StockChangeColor({
    this.changesPercentage,
  });

  factory StockChangeColor.fromJson(Map<String, dynamic> json) {
    return StockChangeColor(
      changesPercentage: json['changesPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['changesPercentage'] = this.changesPercentage;
    return data;
  }
}
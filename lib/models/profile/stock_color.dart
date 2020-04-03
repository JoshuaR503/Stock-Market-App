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


}
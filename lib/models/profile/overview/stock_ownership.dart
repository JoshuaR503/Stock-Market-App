class StockOwnership {
  final String name;
  final int share;
  final int change;
  final String filingDate;

  StockOwnership({
    this.name,
    this.share,
    this.change,
    this.filingDate
  });

  static List<StockOwnership> toList(List<dynamic> items) {
    return items
    .map((item) => StockOwnership.fromJson(item))
    .toList();
  }

  factory StockOwnership.fromJson(Map<String, dynamic> json) {
    return StockOwnership(
      name: json['name'],
      share: json['share'],

      change: json['change'],
      filingDate: json['filingDate'],
    );
  }

}
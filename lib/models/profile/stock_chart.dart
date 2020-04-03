class StockChart {
  final String date;
  final double close;
  final String label;

  StockChart({
    this.date,
    this.close,
    this.label,

  });

  static List<StockChart> toList(List<dynamic> items) {
    return items
    .map((item) => StockChart.fromJson(item))
    .toList();
  } 

  static StockChart fromJson(Map<dynamic, dynamic> json) {

    final double close = double.parse(json['close'].toString());

    return StockChart(
      date: json['date'],
      close: close,
      label: json['label'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['date'] = this.date;
    data['close'] = this.close;
    data['label'] = this.label;
    return data;
  }
}
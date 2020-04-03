import 'package:meta/meta.dart';

class StockChart {
  final String date;
  final double close;
  final String label;

  StockChart({
    @required this.date,
    @required this.close,
    @required this.label
  });

  static List<StockChart> toList(List<dynamic> items) {
    return items
    .map((item) => StockChart.fromJson(item))
    .toList();
  } 

  factory StockChart.fromJson(Map<dynamic, dynamic> json) {
    return StockChart(
      date: json['date'],
      close: json['close'],
      label: json['label'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic> {}; // DO use collection literals when possible.

    data['date'] = this.date;
    data['close'] = this.close;
    data['label'] = this.label;
    return data;
  }
}
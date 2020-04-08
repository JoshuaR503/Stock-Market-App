import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sma/models/profile/stock_chart.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<StockChart> chart;

  final Color color;

  SimpleTimeSeriesChart({
    @required this.chart,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {

    return charts.TimeSeriesChart(
      [
        charts.Series<RowData, DateTime>(
          id: 'Cost',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(color),
          domainFn: (RowData row, _) => row.timeStamp,
          measureFn: (RowData row, _) => row.cost,
          data: this.chart
            .map((item) => RowData(timeStamp: DateTime.parse(item.date), cost: item.close))
            .toList(),
        ),
      ],

      animate: false,
          
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 1),
        renderSpec: charts.NoneRenderSpec()
      ),
      
    );
  }
}

/// Sample time series data type.
class RowData {
  final DateTime timeStamp;
  final double cost;
  RowData({this.timeStamp, this.cost});
}

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChart extends StatelessWidget {

  final Color color;
  final data = [
    RowData(DateTime(2017, 9, 25), 6),
    RowData(DateTime(2017, 9, 26), 8),
    RowData(DateTime(2017, 9, 27), 6),
    RowData(DateTime(2017, 9, 28), 9),
    RowData(DateTime(2017, 9, 29), 11),
    RowData(DateTime(2017, 9, 30), 15),
    RowData(DateTime(2017, 10, 01), 25),
    RowData(DateTime(2017, 10, 02), 33),
    RowData(DateTime(2017, 10, 03), 27),
    RowData(DateTime(2017, 10, 04), 31),
    RowData(DateTime(2017, 10, 05), 23),
  ];

  SimpleTimeSeriesChart({
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
          data: data,
        ),
      ],
      
      animate: true,
    
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 2),
        renderSpec: charts.NoneRenderSpec()
      ),

      domainAxis: charts.DateTimeAxisSpec(
        showAxisLine: false,
        renderSpec: charts.NoneRenderSpec()
      ),
    );
  }
}

/// Sample time series data type.
class RowData {
  final DateTime timeStamp;
  final int cost;
  RowData(this.timeStamp, this.cost);
}

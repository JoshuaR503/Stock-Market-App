import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChart extends StatelessWidget {

  final Color color;
  final data = [
      MyRow(DateTime(2017, 9, 25), 6),
      MyRow(DateTime(2017, 9, 26), 8),
      MyRow(DateTime(2017, 9, 27), 6),
      MyRow(DateTime(2017, 9, 28), 9),
      MyRow(DateTime(2017, 9, 29), 11),
      MyRow(DateTime(2017, 9, 30), 15),
      MyRow(DateTime(2017, 10, 01), 25),
      MyRow(DateTime(2017, 10, 02), 33),
      MyRow(DateTime(2017, 10, 03), 27),
      MyRow(DateTime(2017, 10, 04), 31),
      MyRow(DateTime(2017, 10, 05), 23),
    ];

  SimpleTimeSeriesChart({
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      
      [
        charts.Series<MyRow, DateTime>(
          id: 'Cost',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(color),
          domainFn: (MyRow row, _) => row.timeStamp,
          measureFn: (MyRow row, _) => row.cost,
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
class MyRow {
  final DateTime timeStamp;
  final int cost;
  MyRow(this.timeStamp, this.cost);
}

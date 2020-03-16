import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

class SimpleTimeSeriesChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      child: BezierChart(
        bezierChartScale: BezierChartScale.CUSTOM,
        xAxisCustomValues: [0, 5, 10, 15, 20, 25, 30, 35, 40],

        series: [
          BezierLine(
            lineColor: kPositiveColor,
            data: [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 130, xAxis: 5),
              DataPoint<double>(value: 50, xAxis: 10),
              DataPoint<double>(value: 150, xAxis: 15),
              DataPoint<double>(value: 75, xAxis: 20),
              DataPoint<double>(value: 0, xAxis: 25),
              DataPoint<double>(value: 5, xAxis: 30),
              DataPoint<double>(value: 45, xAxis: 35),
              DataPoint<double>(value: 5, xAxis: 30),
            ],
          ),

        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          showVerticalIndicator: true,
          xLinesColor: Colors.transparent,
          backgroundColor: Colors.transparent
        ),
      ),
    );
  }
}

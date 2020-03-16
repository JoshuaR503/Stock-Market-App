import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/widgets/spinner.dart';
import 'package:sma/widgets/profile/widgets/graph.dart';
import 'package:sma/widgets/profile/widgets/profile.dart';
import 'package:sma/widgets/profile/widgets/statistics.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class Profile extends StatefulWidget { 

  final String symbol;
  final Color color;

  Profile({
    @required this.symbol,
    @required this.color
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Widget _renderTop({String name, double price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            Text('\$${price.toStringAsFixed(2)}',style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            )),

            FaIcon(FontAwesomeIcons.solidCheckCircle, color: this.widget.color)
          ], 
        ),

        SizedBox(height: 8),

        Text(name, style: kProfileCompanyName),
      ],
    );
  }

  Widget _renderGraph() {
    return Container(

      height: 250,
      child: BezierChart(
        
        bezierChartScale: BezierChartScale.CUSTOM,
        xAxisCustomValues: [0, 5, 10, 15, 20, 25, 30, 35, 40],

        series: [
          BezierLine(
            lineColor: this.widget.color,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(this.widget.symbol),
        backgroundColor: this.widget.color,
      ),
      
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) {

            if (state is ProfileLoaded) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 26, right: 26, top: 26),
                children: <Widget>[

                  this._renderTop(
                    name: state.quote.name, 
                    price: state.quote.price
                  ),

                  this._renderGraph(),

                  StatisticsWidget(quote: state.quote),
                  CompanyProfileWidget(profile: state.profile),
                ],
              );
            }

            return SpinnerWidget(color: this.widget.color);
          },
        )
      )
    );
  }
}
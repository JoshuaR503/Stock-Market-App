

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sma/models/profile/index.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/graph.dart';
import 'package:sma/widgets/profile/widgets/profile.dart';
import 'package:sma/widgets/profile/widgets/statistics.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class ProfileScreen extends StatelessWidget {

  final Color color;
  final StockQuote quote;
  final StockProfile profile;

  ProfileScreen({
    @required this.quote,
    @required this.profile,
    @required this.color
  });

  Widget _renderTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(this.quote.name, style: kProfileCompanyName),
          flex: 8,
        ),

        Expanded(
          child: Container(),
          flex: 4,
        ),
        
        Expanded(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.solidCheckCircle, color: this.color,), 
            onPressed: () {}
          ),
        )
      ],
    );
  }

  Widget _renderChange() {

    final String text = this.quote.change < 0 
      ? '${this.quote.change}  ${this.quote.changesPercentage}%'
      : '+${this.quote.change}  +${this.quote.changesPercentage}%';

    final priceStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );

    final changeStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: this.color
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${NumberFormat().format(this.quote.price)}', style: priceStyle),
          SizedBox(height: 4),
          Text(text, style: changeStyle),
        ],
      ),
    );
  }

  Widget _renderGraph() {
    return Container(
      height: 250,
      child: SimpleTimeSeriesChart(color: this.color)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.quote.symbol),
        backgroundColor: color,
      ),

      backgroundColor: kScaffoldBackground,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 26, right: 26, top: 26),
        children: <Widget>[
          this._renderTop(),
          SizedBox(height: 4),
          this._renderChange(),
          SizedBox(height: 4),
          this._renderGraph(),
          StatisticsWidget(quote: this.quote),
          CompanyProfileWidget(profile: this.profile),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sma/models/markets/market_active/market_active.dart';
import 'package:sma/shared/styles.dart';

class MarketMovers extends StatelessWidget {

  final MarketActiveModel data;
  final Color color;

  MarketMovers({
    @required this.data,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14),
      child: Container(
        child: _buildContent(),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: standatBorder,
          color: color,
        ),
      )
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        // Ticker Symbol.
        Text(data.ticker, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.5
        )),


        // Change percentage.
        SizedBox(height: 5),
        Text(data.changesPercentage),
      ],
    );
  }
}
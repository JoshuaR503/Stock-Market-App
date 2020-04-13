import 'package:flutter/material.dart';
import 'package:sma/models/markets/market_active/market_active.dart';

class MarketMovers extends StatelessWidget {

  final MarketActiveModel data ;
  final Color color;

  MarketMovers({
    @required this.data,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Container(
        child: _buildContent(),
        width: 100,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      )
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(data.ticker, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.5
        )),

        SizedBox(height: 5),
        Text(data.changesPercentage),
      ],
    );
  }
}
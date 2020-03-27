import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/shared/colors.dart';
import 'package:meta/meta.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioIndexes extends StatelessWidget {

  final MarketIndex index;

  PortfolioIndexes({
    @required this.index,
  });

  List<Widget> _buildUpperSection() {

    final icon = index.change < 0 
      ? FontAwesomeIcons.sortDown
      : FontAwesomeIcons.sortUp;

    final color = index.change < 0 
      ? kNegativeColor
      : kPositiveColor;

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(index.symbol, style: kTickerStyle),
              FaIcon(icon, color: color)
            ]
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(index.name, style: kCompanyName, maxLines: 1),
          ),
        ],
      ),

      Text(NumberFormat().format(this.index.price), style: kStockTickerSymbol)  
    ];
  }

  Widget _buildCard() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildUpperSection(),
      ),
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kTileColor,
        child: _buildCard(),
        // TODO: Add handler for Indexes.
        onPressed: () {},
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/shared/colors.dart';
import 'package:meta/meta.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioCard extends StatelessWidget {

  final MarketIndex index;

  PortfolioCard({
    @required this.index,
  });

  Widget _buildUpperSection() {
    final color = index.change < 0 
    ? kNegativeColor
    : kPositiveColor;
    
    final icon = index.change < 0 
    ? FontAwesomeIcons.sortDown
    : FontAwesomeIcons.sortUp;

    return Column(
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
    );
  }

  Widget _buildLowerSection() {
    return Text(index.price.toStringAsFixed(2), style: TextStyle(
      fontSize: 14,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kTileColor,
        child: _buildCard(),
        onPressed: () {},
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildUpperSection(),
          _buildLowerSection(),
        ],
      ),
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 18),
    );
  }
}
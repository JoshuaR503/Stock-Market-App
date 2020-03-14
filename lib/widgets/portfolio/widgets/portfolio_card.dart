import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/text.dart';
import 'package:meta/meta.dart';

class PortfolioCard extends StatelessWidget {

  final MarketIndex index;

  PortfolioCard({
    @required this.index
  });

  Widget _buildUpperSection() {

    final Color color = kNegativeColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(index.ticker, style: kTickerStyle),
            FaIcon(FontAwesomeIcons.sortUp, color: color)
          ]
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(index.indexName, style: kNameStyle),
        )
      ],
    );
  }

  Widget _buildLowerSection() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(index.price.toString(), style: kNameStyle),
        ], 
      ),
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
import 'package:flutter/material.dart';
import 'package:sma/data/stocks.dart';

import 'package:sma/shared/text.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_card.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_tile.dart';

class Portfolio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Portfolio', style: kTitleStyle,),
            Text('Add Holding', style: kSubtitleStyle),
          ],
        ),

        Container(
          height: 205,
          padding: EdgeInsets.symmetric(vertical: 18),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stocks.length,
            itemBuilder: (BuildContext context, int index) => PortfolioCard(stock: stocks[index]),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('View List', style: kSubtitleStyle),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (BuildContext context, int index) => PortfolioTitle(stock: stocks[index]),
          ),
        )
      ],
    );
  }
}
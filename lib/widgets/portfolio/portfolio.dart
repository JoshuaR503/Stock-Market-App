import 'package:flutter/material.dart';
import 'package:sma/models/stock_profile.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/portfolio/widgets/portfolio_card.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_tile.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class Portfolio extends StatelessWidget {

  final List<StockProfile> stocks;

  Portfolio({
    @required this.stocks
  });

  Widget _renderUpperSide() {

    final kSubtitleStyle = const TextStyle(
      color: kNegativeColor,
      fontSize: 18,
      fontWeight: FontWeight.bold
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Portfolio', style: kTitleStyle),
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
      ],
    );
  }

  Widget _renderWatchList() {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: stocks.length,
        itemBuilder: (BuildContext context, int index) => PortfolioTitle(stock: stocks[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget> [

        this._renderUpperSide(),
        this._renderWatchList(),

      ]
    );
  }
}
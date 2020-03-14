import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/models/stock_model.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/text.dart';
import 'package:meta/meta.dart';

class PortfolioCard extends StatelessWidget {

  final StockModel stock;

  PortfolioCard({
    @required this.stock
  });

  Widget _buildUpperSection() {

    final Color color = kNegativeColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(stock.tickerSymbol, style: kTickerStyle),
            FaIcon(FontAwesomeIcons.sortUp, color: color)
          ]
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(stock.name, style: kNameStyle),
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
          Text('\$${stock.price}', style: kNameStyle),
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
      width: 110,
      padding: EdgeInsets.symmetric(vertical: 18),
    );
  }
}
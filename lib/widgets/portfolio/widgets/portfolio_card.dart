import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/models/share.dart';
import 'package:sma/shared/text.dart';
import 'package:meta/meta.dart';

class PortfolioCard extends StatelessWidget {

  final StockData stock;

  PortfolioCard({
    @required this.stock
  });

  Widget _buildUpperSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(stock.tickerSymbol, style: kTickerStyle),
            FaIcon(FontAwesomeIcons.sortUp)
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
        color: stock.color,
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
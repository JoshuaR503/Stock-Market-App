

import 'package:flutter/material.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/data_overview.dart';

import 'package:sma/widgets/portfolio/widgets/styles.dart';

class WatchlistStockPrice extends StatelessWidget {

  final DataOverview stock;
  final bool isMarketOpen;

  WatchlistStockPrice({
    @required this.stock,
    @required this.isMarketOpen
  });


  Widget _renderLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.stock.symbol, style: kStockTickerSymbol),
        SizedBox(height: 6.0),
        Text(this.stock.name, style: kCompanyName)
      ], 
    );
  }

  Widget _renderRightColumn() {

    final String text = stock.changesPercentage < 0 
      ? '${formatText(stock.change)}'
      : '+${formatText(stock.change)}';
      
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text('\$${formatText(stock.price)}'),
        SizedBox(height: 6.0),
        Text(text, style: stock.changesPercentage < 0 
          ? kNegativeChange
          : kPositiveChange
        )
      ], 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _renderLeftColumn(),
        _renderRightColumn()
      ],
    );
  }
}
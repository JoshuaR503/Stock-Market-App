
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sma/helpers/text_helper.dart';

import 'package:sma/models/stock_overview.dart';
import 'package:sma/respository/portfolio/repository.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class WatchlistStockPrice extends StatefulWidget {

  final StockOverview stock;
  final bool isMarketOpen;

  WatchlistStockPrice({
    @required this.stock,
    @required this.isMarketOpen
  });

  @override
  _WatchlistStockPriceState createState() => _WatchlistStockPriceState();
}

class _WatchlistStockPriceState extends State<WatchlistStockPrice> {

  double price;
  double changesPercentage;

  Timer timer;

  // Helpers.
  String renderPrice() {
    return '\$${formatText(price)}';
  }

  String renderText() {
    return changesPercentage < 0 
      ? '${formatText(changesPercentage)}'
      : '+${formatText(changesPercentage)}';
  }

  void fetch() async {
    final repo = PortfolioRepository();
    final response = await repo.fetchProfile(symbol: this.widget.stock.symbol);

    setState(() {
      this.price = response.price;
      this.changesPercentage = response.changesPercentage;
    });
  }

  @override
  void initState() {

    if (this.widget.isMarketOpen) {
      final Random random = Random();
      final int ranMilliseconds = random.nextInt(5) + 3;
      final Duration duration = Duration(seconds: ranMilliseconds);

      timer = Timer.periodic(duration, (_) => fetch());
    }

    this.price = this.widget.stock.price;
    this.changesPercentage = this.widget.stock.changesPercentage;

    super.initState();
  }

  @override
  void dispose() {

    if (this.widget.isMarketOpen) {
      timer.cancel();
    }

    this.price = null;
    this.changesPercentage = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Text(this.widget.stock.symbol, style: kStockTickerSymbol),
            SizedBox(height: 6.0),
            Text(this.widget.stock.name, style: kCompanyName)
          ], 
        ),
  
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(renderPrice()),
            SizedBox(height: 6.0),
            Text(renderText(), style: changesPercentage < 0 
              ? kNegativeChange
              : kPositiveChange
            )
          ], 
        ),

      ],
    );
  }
}
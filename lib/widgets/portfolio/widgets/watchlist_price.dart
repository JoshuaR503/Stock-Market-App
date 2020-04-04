
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/data_overview.dart';

import 'package:sma/respository/portfolio/repository.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class WatchlistStockPrice extends StatefulWidget {

  final DataOverview stock;
  final bool isMarketOpen;

  WatchlistStockPrice({
    @required this.stock,
    @required this.isMarketOpen
  });

  @override
  _WatchlistStockPriceState createState() => _WatchlistStockPriceState();
}

class _WatchlistStockPriceState extends State<WatchlistStockPrice> {

  Timer timer;

  Future<DataOverview> _future() async {
    if (this.widget.isMarketOpen) {
      return await PortfolioRepository().fetchData(symbol: this.widget.stock.symbol);
    } else {
      return this.widget.stock;
    }
  }

  @override
  void initState() {

    if (this.widget.isMarketOpen) {
      final Random random = Random();
      final int ranMilliseconds = random.nextInt(5) + 3;
      final Duration duration = Duration(seconds: ranMilliseconds);

      timer = Timer.periodic(duration, (_) => setState(() {}));
    }

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget _renderLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.widget.stock.symbol, style: kStockTickerSymbol),
        SizedBox(height: 6.0),
        Text(this.widget.stock.name, style: kCompanyName)
      ], 
    );
  }

  Widget _renderRightColumn() {
    return FutureBuilder(

      future: this._future(),
      builder: (BuildContext context, AsyncSnapshot<DataOverview> snapshot) {

        if (snapshot.hasData) {

          final String text = snapshot.data.changesPercentage < 0 
            ? '${formatText(snapshot.data.changesPercentage)}%'
            : '+${formatText(snapshot.data.changesPercentage)}%';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('\$${formatText(snapshot.data.price)}'),
              SizedBox(height: 6.0),
              Text(text, style: snapshot.data.changesPercentage < 0 
                ? kNegativeChange
                : kPositiveChange
              )
            ], 
          );
        }

        return Container();
      },
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
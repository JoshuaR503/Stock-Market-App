import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/market_index.dart';

import 'package:sma/respository/portfolio/repository.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class ProfileIndexPrice extends StatefulWidget {

  final MarketIndex index;
  final bool isMarketOpen;

  ProfileIndexPrice({
    @required this.index,
    @required this.isMarketOpen
  });

  @override
  _ProfileIndexPriceState createState() => _ProfileIndexPriceState();
}

class _ProfileIndexPriceState extends State<ProfileIndexPrice> {

  Timer timer;

  Future<MarketIndex> _future() async {
    if (this.widget.isMarketOpen) {
      return await PortfolioRepository().fetchMarketIndex(symbol: this.widget.index.symbol);
    } else {
      return this.widget.index;
    }
  }

  @override
  void initState() {

    if (this.widget.isMarketOpen) {
      timer = Timer.periodic(Duration(seconds: 3), (_) => setState(() {}));
    }

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._future(),
      builder: (BuildContext context, AsyncSnapshot<MarketIndex> snapshot) {

        if (snapshot.hasError) {
          return Text('error');
        }

        if (snapshot.hasData) {
          return Text(formatText(snapshot.data.price), style: kStockTickerSymbol);
        }

        return Text('Realoading');
      },
    );
  }
}
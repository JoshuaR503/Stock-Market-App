import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/respository/profile/repository.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class ProfilePrice extends StatefulWidget {

  final bool isMarketOpen;
  final Color color;
  final StockQuote quote;

  ProfilePrice({
    @required this.isMarketOpen,
    @required this.color,
    @required this.quote,
  });

  @override
  _ProfilePriceState createState() => _ProfilePriceState();
}

class _ProfilePriceState extends State<ProfilePrice> {
  Timer timer;

  Future<StockQuote> _future() async {
    if (this.widget.isMarketOpen) {
      return await ProfileRepository().fetchProfileChanges(symbol: this.widget.quote.symbol);
    } else {
      return this.widget.quote;
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

  Widget _renderContent(StockQuote data) {
    final String text = data.change < 0 
      ? '${formatText(data.change)}   ${formatText(data.changesPercentage)}%'
      : '+${formatText(data.change)}   +${formatText(data.changesPercentage)}%';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(data.price)}', style: priceStyle),
          SizedBox(height: 4),
          Text(text, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: this.widget.color
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._future(),
      initialData: this.widget.quote,
      builder: (BuildContext context, AsyncSnapshot<StockQuote> snapshot) {

        if (snapshot.hasData) {
          return _renderContent(snapshot.data);
        }

        if (snapshot.error) {
          return Text('There was an unknown error.');
        }

        return Container();
      }
    );
  }
}

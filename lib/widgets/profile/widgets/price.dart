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
    super.initState();
    
    if (this.widget.isMarketOpen) {
      timer = Timer.periodic(Duration(milliseconds: 2000), (_) => setState(() {}));
    }
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
      builder: (BuildContext context, AsyncSnapshot<StockQuote> snapshot) {

        if (snapshot.hasData) {

          final String text = snapshot.data.change < 0 
            ? '${formatText(snapshot.data.change)}   ${formatText(snapshot.data.changesPercentage)}%'
            : '+${formatText(snapshot.data.change)}   +${formatText(snapshot.data.changesPercentage)}%';

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text('\$${formatText(snapshot.data.price)}', style: priceStyle),
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

        return Container();
      }
    );
  }
}

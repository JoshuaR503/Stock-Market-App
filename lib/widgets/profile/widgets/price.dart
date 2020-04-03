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

  double price;
  double change; 
  double changesPercentage;

  void fetch() async {

    final repository = ProfileRepository();
    final response = await repository.fetchChanges(symbol: this.widget.quote.symbol);

    setState(() {
      price = response['price'];
      change = response['change'];
      changesPercentage = response['changesPercentage'];
    });
  }

  @override
  void initState() {
    super.initState();
    
    if (this.widget.isMarketOpen) {
      timer = Timer.periodic(Duration(milliseconds: 2000), (_) => fetch());
    }

    price = widget.quote.price;
    change = widget.quote.change;
    changesPercentage = widget.quote.changesPercentage;
  }

  @override
  void dispose() {

    if (this.widget.isMarketOpen) {
      timer.cancel();
    }

    this.price = null;
    this.change = null; 
    this.changesPercentage = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final negativeChange = '${formatText(this.change)}   ${formatText(this.changesPercentage)}%';
    final positiveChange = '+${formatText(this.change)}   +${formatText(this.changesPercentage)}%';
    final String text = this.change < 0 
      ? negativeChange
      : positiveChange;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(this.price)}', style: priceStyle),
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
}

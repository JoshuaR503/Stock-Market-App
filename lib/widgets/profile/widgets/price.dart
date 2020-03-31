import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sma/models/profile/stock_quote.dart';
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

    final response = await Dio().get('https://financialmodelingprep.com/api/v3/quote/${this.widget.quote.symbol}');

    setState(() {
      price = response.data[0]['price'];
      change = response.data[0]['change'];
      changesPercentage = response.data[0]['changesPercentage'];
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

    print('Market is open: ${this.widget.isMarketOpen}');

    if (this.widget.isMarketOpen) {
      timer.cancel();
    }

    this.price = null;
    this.change = null; 
    this.changesPercentage = null;

    super.dispose();
  }

  String _formatText(dynamic text ) {
    return  NumberFormat().format(text);
  }

  @override
  Widget build(BuildContext context) {

    final changeStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: this.widget.color
    );

    final String text = this.change < 0 
      ? '${_formatText(this.change)}  ${_formatText(this.changesPercentage)}%'
      : '+${_formatText(this.change)}  +${_formatText(this.changesPercentage)}%';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${_formatText(this.price)}', style: priceStyle),
          SizedBox(height: 4),
          Text(text, style: changeStyle),
        ],
      ),
    );
  }
}

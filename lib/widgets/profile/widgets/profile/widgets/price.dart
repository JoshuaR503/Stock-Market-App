
import 'package:flutter/material.dart';
import 'package:sma/helpers/color_helper.dart';

import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class ProfilePrice extends StatelessWidget {

  final Color color;
  final StockQuote quote;

  ProfilePrice({
    @required this.color,
    @required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(quote.price)}', style: priceStyle),
          SizedBox(height: 8),
          Text('${determineTextBasedOnChange(quote.change)}  -  (${determineTextPercentageBasedOnChange(quote.changesPercentage)})', 
            style: determineTextStyleBasedOnChange(quote.change)
          )
        ],
      ),
    );
  }
}

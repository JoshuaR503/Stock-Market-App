
import 'package:flutter/material.dart';

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
    final String text = quote.change < 0 
      ? '${formatText(quote.change)}   ${formatText(quote.changesPercentage)}%'
      : '+${formatText(quote.change)}   +${formatText(quote.changesPercentage)}%';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(quote.price)}', style: priceStyle),
          SizedBox(height: 4),
          Text(text, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: this.color
          )),
        ],
      ),
    );
  }
}

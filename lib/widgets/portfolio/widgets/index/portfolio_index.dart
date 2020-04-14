import 'package:flutter/material.dart';
import 'package:sma/helpers/color_helper.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/profile/market_index.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/styles.dart';

class PortfolioIndexWidget extends StatelessWidget {

  final MarketIndexModel index;

  PortfolioIndexWidget({
    @required this.index
  });

  static const _indexNameStyle = const TextStyle(
   fontWeight: FontWeight.bold,
   fontSize: 16
  );

  static const _indexPriceStyle = const TextStyle(
    fontSize: 14,
    color: kLightGray
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.only(left: 2, right: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(index.indexName, style: _indexNameStyle, maxLines: 1),      
            Text(formatText(index.price), style: _indexPriceStyle),     

            Container(
              decoration: BoxDecoration(
                borderRadius: standatBorder,
                color: determineColorBasedOnChange(index.changes)
              ),

              width: 80,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(formatText(index.changes)),
            ),
          ]
        ),
      ),
      
      onPressed: () {},
    );
  }
}
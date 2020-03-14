import 'package:flutter/material.dart';

import 'package:sma/models/stock_profile.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioTitle extends StatelessWidget {

  final StockProfile stock;

  PortfolioTitle({
    @required this.stock
  });

  void _onPressedHandler() {}

  List<Widget> _renderContent() {

    final double height = 6.0;

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(this.stock.symbol, style: kTickerSymbol),
          SizedBox(height: height),
          Text(this.stock.companyName, style: kCompanyName)
        ], 
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('\$${stock.price}'),
          SizedBox(height: height),
          Text(this.stock.changesPercentage, style: kNegativeChange)
        ], 
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(

        height: 100,
        color: kTileColor,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: this._renderContent()
        ),
        
        onPressed: this._onPressedHandler,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
      ),
    );
  }
}


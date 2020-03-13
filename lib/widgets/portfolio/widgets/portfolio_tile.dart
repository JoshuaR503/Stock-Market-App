import 'package:flutter/material.dart';
import 'package:sma/models/share.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioTitle extends StatelessWidget {

  final StockData stock;

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
          Text(this.stock.tickerSymbol, style: kTickerSymbol),
          SizedBox(height: height),
          Text(this.stock.name, style: kCompanyName)
        ], 
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('\$${stock.price}'),
          SizedBox(height: height),
          Text(this.stock.change, style: kNegativeChange)
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


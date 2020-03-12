import 'package:flutter/material.dart';
import 'package:sma/models/share.dart';

class PortfolioTitle extends StatelessWidget {

  final StockData stock;

  PortfolioTitle({
    @required this.stock
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(

        height: 100,
        onPressed: () {},

        color: Color(0XFF3d3d3d),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(this.stock.tickerSymbol),
                Text(this.stock.name)
              ], 
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('\$${stock.price}'),
                Text(this.stock.change)
              ], 
            ),
          ],
        ),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:sma/models/share.dart';
import 'package:sma/shared/text.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_card.dart';
import 'package:sma/widgets/watchlist/widgets/tile.dart';

class Portfolio extends StatelessWidget {

  final  List<StockData> stocks = [
    StockData(
      color: Color(0XFF3d3d3d),
      name: 'Apple Inc.',
      tickerSymbol: 'AAPL',
      price: '288.95'
    ),

    StockData(
      color: Color(0XFF3d3d3d),
      name: 'Mastercard Incorporated',
      tickerSymbol: 'MA',
      price: '287.01'
    ),

    StockData(      
      color: Color(0XFF3d3d3d),
      name: 'Visa Inc.',
      tickerSymbol: 'V',
      price: '184.36'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Portfolio', style: kTitleStyle,),
            Text('View List', style: kSubtitleStyle),
          ],
        ),

        SizedBox(height: 20),

        Container(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stocks.length,
            itemBuilder: (BuildContext context, int index) {
              return PortfolioCard(stock: stocks[index]);
            },
          ),
        ),
        
        SizedBox(height: 24),
        WatchlistTile(),

        SizedBox(height: 16),
        WatchlistTile(),

        SizedBox(height: 16),
        WatchlistTile(),

        SizedBox(height: 16),
        WatchlistTile(),

        SizedBox(height: 16),
        WatchlistTile(),

      ],
    );
  }
}


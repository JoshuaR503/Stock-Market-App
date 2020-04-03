
import 'package:flutter/material.dart';

import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class StatisticsWidget extends StatelessWidget {
  
  final StockQuote quote;

  StatisticsWidget({
    @required this.quote
  });

  static Text _renderText(dynamic text) {

    if (text != null) {
      return Text(compactText(text));
    }

    return Text('-');
  }
  
  List<Widget> _leftColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Open', style: subtitleStyle),
        trailing: _renderText(quote.open)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Prev close', style: subtitleStyle),
        trailing: _renderText(quote.previousClose)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Day High', style: subtitleStyle),
        trailing: _renderText(quote.dayHigh)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Day Low', style: subtitleStyle),
        trailing: _renderText(quote.dayLow)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK High', style: subtitleStyle),
        trailing: _renderText(quote.yearHigh)
      ),

      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK Low', style: subtitleStyle),
        trailing: _renderText(quote.dayLow)
      ),
    ];
  }

  List<Widget> _rightColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Outstanding Shares', style: subtitleStyle),
        trailing: _renderText(quote.sharesOutstanding)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Volume', style: subtitleStyle),
        trailing: _renderText(quote.volume)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Avg Vol', style: subtitleStyle),
        trailing: _renderText(quote.avgVolume)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('MKT Cap', style: subtitleStyle),
        trailing: _renderText(quote.marketCap)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('P/E Ratio', style: subtitleStyle),
        trailing: _renderText(quote.pe)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('EPS', style: subtitleStyle),
        trailing: _renderText(quote.eps)
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16),

        Text('Statistics',style: kProfileScreenSectionTitle),
        SizedBox(height: 8),

        Row(
          children: <Widget>[
            Expanded(
              child: Column(children: _leftColumn()),
            ),

            SizedBox(width: 40),

            Expanded(
              child: Column(children: _rightColumn()),
            )
          ],
        ),

        SizedBox(height: 36),
      ],
    );
  }
}
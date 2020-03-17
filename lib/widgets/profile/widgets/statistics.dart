
import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import 'package:sma/models/profile/quote.dart';
import 'package:sma/shared/colors.dart';

class StatisticsWidget extends StatelessWidget {
  
  final style =  TextStyle(color: kLighterGray);
  final StockQuote quote;

  StatisticsWidget({
    @required this.quote
  });

  static Text _renderText(dynamic text) {
    return Text('${NumberFormat.compact().format(text)}');
  }
  
  List<Widget> _leftColumn() {

    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Open', style: style),
        trailing: _renderText(quote.open)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('High', style: style),
        trailing: _renderText(quote.dayHigh)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Low', style: style),
        trailing: _renderText(quote.dayLow)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK High', style: style),
        trailing: _renderText(quote.yearHigh)
      ),

      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK Low', style: style),
        trailing: _renderText(quote.dayLow)
      ),
    ];
  }

  List<Widget> _rightColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Volume', style: style),
        trailing: _renderText(quote.volume)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Avg Vol', style: style),
        trailing: _renderText(quote.avgVolume)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('MKT Cap', style: style),
        trailing: _renderText(quote.marketCap)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('P/E Ratio', style: style),
        trailing: _renderText(quote.pe)
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('EPS year', style: style),
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

        Text('Statistics',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        )),

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
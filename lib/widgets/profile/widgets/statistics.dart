
import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import 'package:sma/models/profile/quote.dart';
import 'package:sma/shared/colors.dart';

class StatisticsWidget extends StatelessWidget {
  
  final style =  TextStyle(color: kLightGray);
  final StockQuote quote;

  StatisticsWidget({
    @required this.quote
  });
  

  List<Widget> _leftColumn() {

    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Open', style: style),
        trailing: Text('${quote.open}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('High', style: style),
        trailing: Text('${quote.dayHigh}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Low', style: style),
        trailing: Text('${quote.dayLow}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK High', style: style),
        trailing: Text('${quote.yearHigh}'),
      ),

      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK Low', style: style),
        trailing: Text('${quote.yearLow}'),
      ),
    ];
  }

  List<Widget> _rightColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Volume', style: style),
        trailing: Text('${NumberFormat.compact().format(quote.volume)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Avg Vol', style: style),
        trailing: Text('${NumberFormat.compact().format(quote.avgVolume)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('MKT Cap', style: style),
        trailing: Text('${NumberFormat.compact().format(quote.marketCap)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('P/E Ratio', style: style),
        trailing: Text('${NumberFormat().format(quote.pe)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('EPS year', style: style),
        trailing: Text('${quote.eps}'),
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30),

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

        SizedBox(height: 30),
      ],
    );
  }
}

import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import 'package:sma/models/profile/quote.dart';

class StatisticsWidget extends StatelessWidget {

  final StockQuote quote;

  StatisticsWidget({
    @required this.quote
  });

  List<Widget> _leftColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Open'),
        trailing: Text('${quote.open}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('High'),
        trailing: Text('${quote.dayHigh}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Low'),
        trailing: Text('${quote.dayLow}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK High'),
        trailing: Text('${quote.yearHigh}'),
      ),

      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK Low'),
        trailing: Text('${quote.yearLow}'),
      ),
    ];
  }

  List<Widget> _rightColumn() {

    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Volume'),
        trailing: Text('${NumberFormat.compact().format(quote.volume)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Avg Vol'),
        trailing: Text('${NumberFormat.compact().format(quote.avgVolume)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('MKT Cap'),
        trailing: Text('${NumberFormat.compact().format(quote.marketCap)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('P/E Ratio'),
        trailing: Text('${NumberFormat().format(quote.pe)}'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('EPS year'),
        trailing: Text('${quote.eps}'),
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Statistics',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),

        SizedBox(height: 8),

        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(children: _leftColumn()),
            ),

            SizedBox(width: 40),

            Expanded(
              flex: 1,
              child: Column(children: _rightColumn()),
            )
          ],
        )
      ],
    );
  }
}
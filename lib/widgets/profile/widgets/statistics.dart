
import 'package:flutter/material.dart';

class StatisticsWidget extends StatelessWidget {

  List<Widget> _leftColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Open'),
        trailing: Text('264.89'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('High'),
        trailing: Text('289.00'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Low'),
        trailing: Text('328,09'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK High'),
        trailing: Text('232.9'),
      ),

      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('52 WK Low'),
        trailing: Text('82.9'),
      ),
    ];
  }

  List<Widget> _rightColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Volume'),
        trailing: Text('83.9M'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('AVG Vol'),
        trailing: Text('23.4M'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('MKT Cap'),
        trailing: Text('1.20T'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('P/E Ratio'),
        trailing: Text('21.95'),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('EPS'),
        trailing: Text('\$3.4'),
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

            SizedBox(width: 50),

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
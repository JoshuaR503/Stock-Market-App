
import 'package:flutter/material.dart';
import 'package:sma/helpers/text/text_helper.dart';

import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class StatisticsWidget extends StatelessWidget {
  
  final StockQuote quote;
  final StockProfile profile;

  StatisticsWidget({
    @required this.quote,
    @required this.profile
  });

  static Text _renderText(dynamic text) {
    return text != null 
    ? Text(compactText(text))
    : Text('-');
  }
  
  List<Widget> _leftColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Open', style: subtitleStyle),
        trailing: _renderText(quote.open)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Prev close', style: subtitleStyle),
        trailing: _renderText(quote.previousClose)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Day High', style: subtitleStyle),
        trailing: _renderText(quote.dayHigh)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Day Low', style: subtitleStyle),
        trailing: _renderText(quote.dayLow)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('52 WK High', style: subtitleStyle),
        trailing: _renderText(quote.yearHigh)
      ),

      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('52 WK Low', style: subtitleStyle),
        trailing: _renderText(quote.dayLow)
      ),
    ];
  }

  List<Widget> _rightColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Outstanding Shares', style: subtitleStyle),
        trailing: _renderText(quote.sharesOutstanding)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Volume', style: subtitleStyle),
        trailing: _renderText(quote.volume)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Avg Vol', style: subtitleStyle),
        trailing: _renderText(quote.avgVolume)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('MKT Cap', style: subtitleStyle),
        trailing: _renderText(quote.marketCap)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('P/E Ratio', style: subtitleStyle),
        trailing: _renderText(quote.pe)
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
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

        Text('Summary',style: kProfileScreenSectionTitle),
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
        Divider(),

        

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('CEO', style: subtitleStyle),
          trailing: Text(displayDefaultTextIfNull(profile.ceo)),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Sector', style: subtitleStyle),
          trailing: Text(displayDefaultTextIfNull(profile.sector)),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Exchange', style: subtitleStyle),
          trailing: Text('${profile.exchange}'),
        ),
        Divider(),

        Text('About ${profile.companyName ?? '-'} ',style: kProfileScreenSectionTitle),
        SizedBox(height: 8),

        Text(profile.description ?? '-',
          style: TextStyle(
            fontSize: 16,
            color: kLighterGray,
            height: 1.75
          ),
        ),
        Divider(),
        
        SizedBox(height: 30),
      ],
    );
  }
}
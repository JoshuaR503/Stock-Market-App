import 'package:flutter/material.dart';
import 'package:sma/helpers/url/url.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/widgets/base_list.dart';

class Attributions extends StatelessWidget {

  static const _kHeadlineStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold
  );

  static const _kTextStyle = const TextStyle(
    color:  kLighterGray,
    height: 1.8,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return BaseList(
      children: <Widget>[
        _buildContent(
          title: 'Application Developed by Joshua García',
          text: 'This app is open soruce. You can find it\'s source code by tapping here. This app was made with ❤️.',
          url: 'https://github.com/JoshuaR503/Stock-Market-App'
        ),
        Divider(),

        _buildContent(
          title: 'Crafted with Flutter',
          text: 'None of this would have been posible without Flutter and its amazing community and packages.',
          url: 'https://flutter.dev/'
        ),
        Divider(),

        _buildContent(
          title: 'Financial Modeling Prep API',
          text: 'The Portfolio & Markets are powered by this API. Tap here to learn more.',
          url: 'https://financialmodelingprep.com/developer/docs/'
        ),
        Divider(),

        _buildContent(
          title: 'Alpha Vantage API',
          text: 'The Search section is powered by Alpha Vantage API. Tap here to learn more.',
          url: 'https://www.alphavantage.co/documentation/'
        ),
        Divider(),

        _buildContent(
          title: 'Finnhub Stock API',
          text: 'The news section in the Profile page is powered by the Finnhub Stock API. Tap here to learn more.',
          url: 'https://finnhub.io/'
        ),

        Divider(),
        _buildContent(
          title: 'Powered by NewsAPI.org',
          text: 'The news section is powered by the News API. Tap here to learn more.',
          url: 'https://newsapi.org/'
        ),
      ],
    );
  }

  Widget _buildContent({String title, String text, String url}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () => launchUrl(url),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: _kHeadlineStyle),
            SizedBox(height: 4),
            Text(text, style: _kTextStyle),
          ],
        ),
      ),
    );
  }
}
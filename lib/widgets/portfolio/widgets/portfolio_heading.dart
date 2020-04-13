
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_search.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioHeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String formatted = DateFormat('MMMMd').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Portfolio', style: kPortfolioScreenTitle),
            GestureDetector(
              child: FaIcon(FontAwesomeIcons.search, size: 22,),
              onTap: () => showSearch(context: context, delegate: PortfolioSearch()),
            )
          ],
        ),
        Text(formatted, style: kPortfolioScreenDate),
      ],
    );
  }
}
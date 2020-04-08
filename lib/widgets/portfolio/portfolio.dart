import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sma/widgets/portfolio/widgets/portfolio_indexes.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_search.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_watchlist.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class Portfolio extends StatelessWidget {

  Widget _renderTop(BuildContext context) {
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

  Widget _renderMarketIndexes() {
    return PortfolioIndexes();
  }

  Widget _renderWatchList() {
    return PortfolioWatchList();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 18, right: 18, top: 14),
      children: <Widget>[
        this._renderTop(context),
        this._renderMarketIndexes(),
        this._renderWatchList()
      ],
    );
  }
}
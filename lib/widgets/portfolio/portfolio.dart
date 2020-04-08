import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sma/shared/colors.dart';

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

  Widget _renderFirstChild() {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 18, right: 18, top: 0),
      children: <Widget>[
        this._renderMarketIndexes(),
        this._renderWatchList()
      ]
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
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 14),
            child: this._renderTop(context),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: TabBar(
              indicatorColor: Color(0X88ffffff),
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
              tabs: [
                Tab(text: 'Stonks'),
                Tab(text: 'Markets'),
                Tab(text: 'News'),
              ]
            ),
          ),
          
          Expanded(
            flex: 1,
            child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              this._renderFirstChild(),
              Center(child: Text('Markets section comming soon.')),
              Center(child: Text('News section comming soon.'))
            ],
          ),
          )
        ],
      ),
      
    );
  }
}
import 'package:flutter/material.dart';

import 'package:sma/models/profile/profile.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/price.dart';
import 'package:sma/widgets/profile/widgets/profile_about.dart';
import 'package:sma/widgets/profile/widgets/profile_graph.dart';
import 'package:sma/widgets/profile/widgets/profile_statistics.dart';
import 'package:sma/widgets/profile/widgets/save_button.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class ProfileScreen extends StatelessWidget {

  final bool isMarketOpen;
  final bool isSaved;
  final Color color;
  final ProfileModel profile;

  ProfileScreen({
    @required this.isMarketOpen,
    @required this.isSaved,
    @required this.profile,
    @required this.color,
  });

  Widget _renderUpperPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(this.profile.stockQuote.name, style: kProfileCompanyName),
              flex: 8,
            ),

            Expanded(
              child: Container(),
              flex: 4,
            ),

            WatchlistButtonWidget(
              color: this.color,
              isSaved: this.isSaved,
              symbol: this.profile.stockQuote.symbol,
            )
          ],
        ),

        ProfilePrice(
          isMarketOpen: this.isMarketOpen,
          color: this.color,
          quote: this.profile.stockQuote,
        ),

        Container(
          height: 300,
          padding: EdgeInsets.only(top: 26),
          child: SimpleTimeSeriesChart(
            chart: this.profile.stockChart,
            color: this.color
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.profile.stockQuote.symbol),
        backgroundColor: color,
      ),

      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 26, right: 26, top: 26),
          children: <Widget>[
            this._renderUpperPart(),
            StatisticsWidget(quote: this.profile.stockQuote),
            CompanyProfileWidget(profile: this.profile.stockProfile),
          ],
        ),
      )
    );
  }
}
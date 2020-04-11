import 'package:flutter/material.dart';
import 'package:sma/models/profile/profile.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/news/news.dart';
import 'package:sma/widgets/profile/widgets/overview/profile_overview.dart';
import 'package:sma/widgets/profile/widgets/profile/profile.dart';
import 'package:sma/widgets/profile/widgets/profile/save_button.dart';

import 'widgets/overview/overview.dart';

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

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.profile.stockQuote.symbol),
          backgroundColor: color,
          bottom: TabBar(
            indicatorColor: Color(0X881f1f1f),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Profile',),
              Tab(text: 'News',),
              Tab(text: 'Information',)
            ],
          ),
          
          actions: <Widget>[
            WatchlistButtonWidget(
              symbol: profile.stockQuote.symbol,
              isSaved: isSaved,
              color: Colors.white,
            )
          ],
        ),
        
        backgroundColor: kScaffoldBackground,
        body: SafeArea(
          child: TabBarView(
            children: [
              
              Profile(
                color: color,
                profile: profile,
                isSaved: isSaved,
              ),

              ProfileNewsScreen(news: profile.stockNews,),
              ProfileOverviewScreen(
                stockOwnership: profile.stockOwnership,
                profile: profile.stockProfile,
              )
            ]
          ),
        )
      ),
    );
  }
}
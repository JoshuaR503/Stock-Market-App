import 'package:flutter/material.dart';
import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/storage/storage.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/news/news.dart';
import 'package:sma/widgets/profile/widgets/profile/profile.dart';
import 'package:sma/widgets/profile/widgets/widget/save_button.dart';

class ProfileScreen extends StatelessWidget {

  final bool isSaved;
  final Color color;
  final ProfileModel profile;

  ProfileScreen({
    @required this.isSaved,
    @required this.profile,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
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
            ],
          ),
          
          actions: <Widget>[
            WatchlistButtonWidget(
              storageModel: StorageModel(
                symbol: profile.stockQuote.symbol, 
                companyName: profile.stockProfile.companyName
              ),
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
                stockProfile: profile.stockProfile,
                stockChart: profile.stockChart,
                stockQuote: profile.stockQuote,
              ),

              ProfileNewsScreen(news: profile.stockNews,),
            ]
          ),
        )
      ),
    );
  }
}
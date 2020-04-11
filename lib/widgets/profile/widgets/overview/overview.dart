
import 'package:flutter/material.dart';
import 'package:sma/models/profile/overview/stock_ownership.dart';
import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/widgets/profile/widgets/overview/profile_about.dart';
import 'package:sma/widgets/profile/widgets/overview/profile_overview.dart';

class ProfileOverviewScreen extends StatelessWidget {

  final List<StockOwnership> stockOwnership;
  final StockProfile profile;

  ProfileOverviewScreen({
    this.stockOwnership,
    this.profile
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProfileOverview(ownership: stockOwnership),
        CompanyProfileWidget(profile: profile)
      ],
    );
  }
}
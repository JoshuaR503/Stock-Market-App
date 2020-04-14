import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/portfolio_screen.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_heading.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_indexes.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 18, right: 18, top: 18),
          children: <Widget>[
            PortfolioHeadingWidget(),
            SizedBox(height: 24,),
            PortfolioIndexes(),
            SizedBox(height: 24,),
            PortfolioScreen()
          ]
        )
      ),
    );
  }
}
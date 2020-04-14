import 'package:flutter/material.dart';
import 'package:sma/widgets/portfolio/portfolio_screen.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_heading.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_indexes.dart';
import 'package:sma/widgets/widgets/base_screen.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: <Widget>[
        PortfolioHeadingWidget(),
        SizedBox(height: 24,),
        PortfolioIndexes(),
        SizedBox(height: 24,),
        PortfolioScreen()
      ],
    );
  }
}
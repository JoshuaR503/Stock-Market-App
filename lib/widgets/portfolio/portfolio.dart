import 'package:flutter/material.dart';

import 'package:sma/widgets/portfolio/widgets/heading/portfolio_heading.dart';
import 'package:sma/widgets/portfolio/widgets/index/portfolio_indexes.dart';

import 'package:sma/widgets/portfolio/widgets/stonks/portfolio_stonks.dart';
import 'package:sma/widgets/widgets/base_screen.dart';

class PortfolioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: <Widget>[
        PortfolioHeadingSection(),
        SizedBox(height: 24),
        PortfolioIndexeSection(),
        SizedBox(height: 16),
        PortfolioStonksSection()
      ],
    );
  }
}
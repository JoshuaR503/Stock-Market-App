import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/portfolio/widgets/content/portfolio_stonks.dart';
import 'package:sma/widgets/portfolio/widgets/heading/portfolio_heading.dart';

class PortfolioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: RefreshIndicator(
        
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              PortfolioHeadingSection(),
              PortfolioStonksSection()
            ]
          )
        ),

        onRefresh: () async {
          // Reload stocks section.
          BlocProvider
          .of<PortfolioBloc>(context)
          .add(FetchPortfolioData());
        },
      )
    );
  }
}
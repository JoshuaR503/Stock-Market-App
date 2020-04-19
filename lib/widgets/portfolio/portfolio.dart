import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';

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
      onRefresh: () async {

        // Reload indexes section.
        BlocProvider
        .of<IndexesBloc>(context)
        .add(FetchIndexes());
        
        // Reload stocks section.
        BlocProvider
        .of<PortfolioBloc>(context)
        .add(FetchPortfolioData());
      },
    );
  }
}
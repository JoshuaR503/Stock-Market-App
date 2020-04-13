import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_single_stonk.dart';

import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class PortfolioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (BuildContext context, PortfolioState state) {

        if (state is PortfolioInitial) {
          BlocProvider
          .of<PortfolioBloc>(context)
          .add(FetchPortfoliData());
        }

        if (state is PortfolioEmpty) {
          return EmptyScreen(message: 'Your watchlist is empty.');
        }

        if (state is PortfolioLoadingError) {
          return Center(child: Text(state.error));
        }

        if (state is PortfolioLoaded) {
          return Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.stocks.length,
              itemBuilder: (BuildContext context, int index) => PortfolioSingleStonk(
                dataOverview: state.stocks[index],
              )
            ),
          );
        }

        return LoadingIndicatorWidget();    
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/widgets/portfolio/widgets/stonks/portfolio_stonk.dart';

import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class PortfolioStonksSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (BuildContext context, PortfolioState state) {

        if (state is PortfolioInitial) {
          BlocProvider
          .of<PortfolioBloc>(context)
          .add(FetchPortfolioData());
        }

        if (state is PortfolioEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: EmptyScreen(message: 'Your watchlist is empty'),
          );
        }

        if (state is PortfolioLoadingError) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: EmptyScreen(message: state.error),
          );
        }

        if (state is PortfolioLoaded) {
          return Container(
            child: ListView.builder(
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.stocks.length,
              itemBuilder: (BuildContext context, int index) {
                return PortfolioStockCard(data: state.stocks[index]);
              }
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
          child: LoadingIndicatorWidget(),
        );
      },
    );
  }
}

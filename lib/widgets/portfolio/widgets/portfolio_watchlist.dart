import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/models/data_overview.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/watchlist_price.dart';
import 'package:sma/widgets/profile/profile.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class PortfolioWatchList extends StatelessWidget {

  Widget _build({BuildContext context, DataOverview stock, bool isMarketOpen}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(
        
        color: kTileColor,
        child: WatchlistStockPrice( 
          stock: stock,
          isMarketOpen: isMarketOpen,
        ),

        height: 95,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        onPressed: () {
          Navigator
          .push(context, MaterialPageRoute(builder: (_) {

            BlocProvider
              .of<ProfileBloc>(context)
              .add(FetchProfileData(symbol: stock.symbol));

            return Profile(symbol: stock.symbol);
          }));
        },
      ),
    );
  }

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

        if (state is PortfolioLoaded) {
          return Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.stocks.length,
              itemBuilder: (BuildContext context, int index) => _build(
                context: context,
                stock: state.stocks[index],
                isMarketOpen: state.isMarketOpen
              ),
            ),
          );
        }

        if (state is PortfolioLoadingError) {
          return Center(child: Text(state.error));
        }

        return LoadingIndicatorWidget();    
      },
    );
  }

}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';

import 'package:sma/models/stock_overview.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/profile/profile.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class PortfolioWatchList extends StatelessWidget {

  List<Widget> _renderIndexCard(StockOverview stock) {

    final double height = 6.0;
    final String text = stock.changesPercentage < 0 
      ? '(${stock.changesPercentage})'
      : '(+${stock.changesPercentage})';

    final TextStyle style = stock.changesPercentage < 0 
      ? kNegativeChange
      : kPositiveChange;

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(stock.symbol, style: kStockTickerSymbol),
          SizedBox(height: height),
          Text(stock.name, style: kCompanyName)
        ], 
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('\$${stock.price}'),
          SizedBox(height: height),
          Text(text, style: style)
        ], 
      ),
    ];
  }

  Widget _build(BuildContext context, StockOverview stock) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(
        
        color: kTileColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _renderIndexCard(stock)
        ),

        height: 95,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        onPressed: () {
          Navigator
          .push(context, MaterialPageRoute(builder: (_) {

            BlocProvider
              .of<ProfileBloc>(context)
              .add(FetchProfileData(symbol: stock.symbol));

            return Profile(
              isSaved: true,
              symbol: stock.symbol,
            );
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
              itemBuilder: (BuildContext context, int index) => _build(context, state.stocks[index]),
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


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/bloc/portfolio/portfolio_bloc.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_profile.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/portfolio/widgets/portfolio_card.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_tile.dart';

class Portfolio extends StatelessWidget {

  Widget _renderTop() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Portfolio', style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            )),

            Text('Add Holding', style: const TextStyle(
              color: kLightGray,
              fontSize: 16,
              fontWeight: FontWeight.bold
            )),
          ],
        ),
      ],
    );
  }

  Widget _renderMarketIndexes(List<MarketIndex> indexes) {
    return Container(
      height: 205,
      padding: EdgeInsets.symmetric(vertical: 18),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: indexes.length,
        itemBuilder: (BuildContext context, int index) => PortfolioCard(index: indexes[index]),
      ),
    );
  }

  Widget _renderWatchlistText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text('Watchlist', style: TextStyle(
        color: kLightGray,
        fontSize: 18,
        fontWeight: FontWeight.bold
      )),
    );
  }

  Widget _renderWatchList(List<StockProfile> stocks) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: stocks.length,
        itemBuilder: (BuildContext context, int index) => PortfolioTitle(stock: stocks[index]),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (BuildContext context, PortfolioState state) {
      
        if (state is PortfolioInitial) {

          final stocks = 'AAPL,MSFT,V,MA,FB,JNJ,CVX'.split(',');
          final indexes = '^DJI,^IXIC,^GSPC'.split(',');

          BlocProvider
          .of<PortfolioBloc>(context)
          .add(FetchPortfoliData(
            stockSymbols: stocks,
            marketSymbols: indexes
          ));
        }

        if (state is PortfolioLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PortfolioLoaded) {
          return ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 18, right: 18, top: 46),
            children: <Widget> [
              this._renderTop(),
              this._renderMarketIndexes(state.indexes),
              this._renderWatchlistText(),
              this._renderWatchList(state.stocks),
            ]
          );
        }

        return Center(child: CircularProgressIndicator());    
      },
    );
  }
}
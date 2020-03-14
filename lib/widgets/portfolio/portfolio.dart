import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/bloc/portfolio/portfolio_bloc.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_profile.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/portfolio/widgets/portfolio_card.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_tile.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class Portfolio extends StatelessWidget {

  Widget _renderUpperSide(List<MarketIndex> indexes) {

    final kSubtitleStyle = const TextStyle(
      color: kNegativeColor,
      fontSize: 18,
      fontWeight: FontWeight.bold
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Portfolio', style: kTitleStyle),
            Text('Add Holding', style: kSubtitleStyle),
          ],
        ),

        Container(
          height: 205,
          padding: EdgeInsets.symmetric(vertical: 18),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: indexes.length,
            itemBuilder: (BuildContext context, int index) => PortfolioCard(index: indexes[index]),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('View List', style: kSubtitleStyle),
        ),
      ],
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
          final indexes = '.DJI,.IXIC,.INX'.split(',');

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
            children: <Widget> [
              this._renderUpperSide(state.indexes),
              this._renderWatchList(state.stocks),
            ]
          );
        }
        return Center(child: CircularProgressIndicator());    
      },
    );
  }
}
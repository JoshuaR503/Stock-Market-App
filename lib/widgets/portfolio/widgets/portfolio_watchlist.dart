import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/models/stock_overview.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/profile/profile.dart';

class PortfolioWatchList extends StatelessWidget {

  final StockOverview stock;

  PortfolioWatchList({
    @required this.stock
  });

  List<Widget> _renderContent() {

    final double height = 6.0;
    final String text = stock.changesPercentage < 0 
      ? '(${this.stock.changesPercentage})'
      : '(+${this.stock.changesPercentage})';

    final TextStyle style = this.stock.changesPercentage < 0 
      ? kNegativeChange
      : kPositiveChange;

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.stock.symbol, style: kStockTickerSymbol),
          SizedBox(height: height),
          Text(this.stock.name, style: kCompanyName)
        ], 
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('\$${this.stock.price}'),
          SizedBox(height: height),
          Text(text, style: style)
        ], 
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(
        
        color: kTileColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: this._renderContent()
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

}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';

import 'package:sma/models/stock_profile.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/profile/profile.dart';

class PortfolioTitle extends StatelessWidget {

  final StockProfile stock;

  PortfolioTitle({
    @required this.stock
  });

  Widget _renderText() {
    final style = this.stock.changesPercentage < 0 
      ? kNegativeChange
      : kPositiveChange;

    return Text(
      stock.changesPercentage < 0 
      ? '(-${this.stock.changesPercentage})'
      : '(+${this.stock.changesPercentage})',
      
      style: style
    );
  }

  List<Widget> _renderContent() {

    final double height = 6.0;
    
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(this.stock.symbol, style: kTickerSymbol),
          SizedBox(height: height),
          Text(this.stock.name, style: kCompanyName)
        ], 
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('\$${this.stock.price}'),
          SizedBox(height: height),
          this._renderText()
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

        height: 100,
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
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/helpers/color/color_helper.dart';

import 'package:sma/helpers/text/text_helper.dart';
import 'package:sma/models/data_overview.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/shared/styles.dart';

import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/profile/profile.dart';

class PortfolioStonkWidget extends StatelessWidget {

  final StockOverviewModel stockOverviewModel;

  PortfolioStonkWidget({
    @required this.stockOverviewModel
  });

  static const _companyNameStyle = const TextStyle(
    color: Color(0XFFc2c2c2),
    fontSize: 13
  );

  static const _stockPriceStyle = const TextStyle(
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: MaterialButton(
        color: kTileColor,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(flex: 7, child: _buildCompanyData()),
              Expanded(flex: 5,child: _buildPriceData())
            ],
          ),
        ),

        height: 90,
        shape: RoundedRectangleBorder(borderRadius: kStandatBorder),
        onPressed: () {
          // Trigger fetch event.
          BlocProvider
            .of<ProfileBloc>(context)
            .add(FetchProfileData(symbol: stockOverviewModel.symbol));

          // Send to Profile.
          Navigator
            .push(context, MaterialPageRoute(builder: (_) => Profile(symbol: stockOverviewModel.symbol)));
        },
      ),
    );
  }

  /// This method is in charge of rendering the stock company data.
  /// This is the left side in the card. 
  /// It renders the  [symbol] and the company [name] from [StockOverviewModel].
  Widget _buildCompanyData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(stockOverviewModel.symbol, style: kStockTickerSymbol),
        SizedBox(height: 8.0),
        Text(stockOverviewModel.name, style: _companyNameStyle,)
      ], 
    );
  }
  
  /// This method is in charge of rendering the stock company data.
  /// This is the right side in the card. 
  /// It renders the [change] and the stock's [price] from [StockOverviewModel].
  Widget _buildPriceData() {

    final width = stockOverviewModel.changesPercentage > 99.99 ? null : 75.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: kSharpBorder,
              color: determineColorBasedOnChange(stockOverviewModel.change)
            ),

            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            width: width,
            child: Text('${formatText(stockOverviewModel.changesPercentage)}%', textAlign: TextAlign.end,),
          ),
        ),
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(formatText(stockOverviewModel.price), 
            textAlign: TextAlign.end, 
            style: _stockPriceStyle
          ),
        ),
      ],
    );
  }
}
